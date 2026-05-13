import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth/presentation/state/auth_token_state.dart';

part 'dio_instance.g.dart';

@Riverpod(keepAlive: true)
Dio dioInstance(Ref ref) {
  final instance = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
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
    ),
  );

  return instance;
}
