import 'package:flutter/material.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/common/services/notification_service.dart';
import '../data/repositories/notification_repository.dart';

part 'notification_use_case.g.dart';

@Riverpod(keepAlive: true)
NotificationUseCase notificationUseCase(Ref ref) => NotificationUseCase(ref);

class NotificationUseCase {
  final Ref ref;
  NotificationUseCase(this.ref);

  Future syncFcmToken() async {
    try {
      final token = await ref.read(notificationSvcProvider).getToken();
      if (token != null) {
        await ref.read(notificationRepoProvider).syncFcmToken(token);
      }
    } catch (e) {
      debugPrint('Error syncing FCM token: $e');
    }
  }
}
