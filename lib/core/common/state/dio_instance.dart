import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/presentation/state/auth_token_state.dart';
import 'routes_state.dart';

part 'dio_instance.g.dart';

@Riverpod(keepAlive: true)
Dio dioInstance(Ref ref) {
  // Dynamically set the URL based on the emulator/simulator platform
  final String localBaseUrl = Platform.isAndroid
      ? 'http://10.0.2.2:8000/api/'
      : 'http://127.0.0.1:8000/api/';

  final instance = Dio(
    BaseOptions(
      // baseUrl: 'http://127.0.0.1:8000/api/',
      baseUrl: localBaseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  instance.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = ref.read(authTokenStateProvider.notifier).token();
        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        debugPrint('The header token is: $token');
        return handler.next(options);
      },

      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          ref.read(authTokenStateProvider.notifier).clear();
          ref.read(routesProvider).goNamed(RouteNames.onboarding1Welcome);
        }
      }
    ),
  );

  return instance;
}
