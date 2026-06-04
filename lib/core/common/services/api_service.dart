import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/dio_instance.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) => ApiService(ref);

class ApiService {
  final Ref ref;
  ApiService(this.ref);

  Dio get _dio => ref.read(dioInstanceProvider);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    return _handleRequest(_dio.get(endpoint));
  }

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> body,
    required String endpoint,
  }) async {
    return _handleRequest(_dio.post(endpoint, data: body));
  }

  Future<Map<String, dynamic>> _handleRequest(Future<Response> request) async {
    try {
      final response = await request;
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      // Extract custom message from Laravel if it exists
      if (e.response?.data is Map) {
        final data = e.response!.data as Map<String, dynamic>;
        if (data.containsKey('message')) {
          throw Exception(data['message']);
        }
      }
      // Fallback for network errors
      throw Exception(e.message ?? 'Unknown network error');
    }
  }
}
