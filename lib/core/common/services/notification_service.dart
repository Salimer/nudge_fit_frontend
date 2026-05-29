import 'dart:convert';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../features/home/data/repositories/notification_repository.dart';
import '../state/routes_state.dart';

part 'notification_service.g.dart';

@Riverpod(keepAlive: true)
NotificationService notificationSvc(Ref ref) => NotificationService(ref);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('FCM background message received: ${message.messageId}');
}

class NotificationService {
  final Ref ref;
  NotificationService(this.ref);

  static bool _initialized = false;
  FirebaseMessaging get _messaging => FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _notificationChannel =
      AndroidNotificationChannel(
        'nudge_fit_notifications',
        'Nudge Fit Notifications',
        description: 'Foreground notification channel for Nudge Fit',
        importance: Importance.high,
      );

  Future<void> initialize() async {
    if (_initialized) return;

    try {
      await Firebase.initializeApp();

      const initializationSettings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestSoundPermission: false,
          requestBadgePermission: false,
          requestAlertPermission: false,
        ),
      );

      await _localNotifications.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          final payload = response.payload;
          if (payload != null && payload.isNotEmpty) {
            try {
              final data = jsonDecode(payload) as Map<String, dynamic>;
              _handleNotificationData(data);
            } catch (e) {
              debugPrint(
                'Error parsing local notification response payload: $e',
              );
            }
          }
        },
      );

      if (!kIsWeb && Platform.isAndroid) {
        await _localNotifications
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.createNotificationChannel(_notificationChannel);
      }

      await _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        debugPrint('FCM background message opened app: ${message.messageId}');
        _handleNotificationData(message.data);
      });

      // Handle cold start (terminated app launched from notification tap)
      _messaging
          .getInitialMessage()
          .then((RemoteMessage? message) {
            if (message != null) {
              debugPrint(
                'App launched from terminated state via FCM: ${message.messageId}',
              );
              _handleNotificationData(message.data);
            }
          })
          .catchError((e) {
            debugPrint('Error getting initial FCM message: $e');
          });

      // Listen to dynamic FCM token rotation
      _messaging.onTokenRefresh
          .listen((String token) {
            debugPrint('FCM Token rotated/refreshed: $token');
            ref.read(notificationRepoProvider).syncFcmToken(token).catchError((
              e,
            ) {
              debugPrint('Failed to sync refreshed FCM token: $e');
            });
          })
          .onError((e) {
            debugPrint('Error listening to FCM token refresh: $e');
          });

      if (!kIsWeb && Platform.isAndroid) {
        await _messaging.setAutoInitEnabled(true);
      }

      _initialized = true;
      debugPrint('NotificationService initialized successfully.');
    } catch (e, stack) {
      debugPrint('Failed to initialize NotificationService: $e');
      debugPrint(stack.toString());
    }
  }

  Future<NotificationSettings> askForNotificationPermission() async {
    // Request permission on modern Android (Android 13+ / API 33+)
    if (!kIsWeb && Platform.isAndroid) {
      try {
        await _localNotifications
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
            ?.requestNotificationsPermission();
      } catch (e) {
        debugPrint(
          'Error requesting Android local notification permission: $e',
        );
      }
    }

    return _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<bool> isPermissionGranted() async {
    final settings = await _messaging.getNotificationSettings();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  Future<String?> getToken() => _messaging.getToken();

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('FCM foreground message received: ${message.messageId}');
    debugPrint('Notification data: ${message.data}');
    _showLocalNotification(message);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _notificationChannel.id,
        _notificationChannel.name,
        channelDescription: _notificationChannel.description,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _localNotifications.show(
      message.hashCode,
      notification.title,
      notification.body,
      notificationDetails,
      payload: message.data.isNotEmpty ? jsonEncode(message.data) : null,
    );
  }

  void _handleNotificationData(Map<String, dynamic> data) {
    debugPrint('Handling notification data: $data');
    final route = data['route'] as String?;
    if (route != null && route.isNotEmpty) {
      try {
        final router = ref.read(routesProvider);
        switch (route) {
          case 'settings':
            router.goNamed(RouteNames.settings);
            break;
          case 'history':
            router.goNamed(RouteNames.history);
            break;
          case 'profile':
            router.goNamed(RouteNames.profile);
            break;
          case 'contract':
            router.goNamed(RouteNames.contract);
            break;
          default:
            router.goNamed(RouteNames.homeScreen);
            break;
        }
      } catch (e) {
        debugPrint('Error navigating to route from notification: $e');
      }
    }
  }
}
