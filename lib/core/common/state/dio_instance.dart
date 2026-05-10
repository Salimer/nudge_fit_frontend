import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_instance.g.dart';

@Riverpod(keepAlive: true)
Dio dioInstance(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );
}
