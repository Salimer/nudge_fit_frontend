import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/dio_instance.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) => ApiService(ref);

class ApiService {
  final Ref ref;
  ApiService(this.ref);

  Dio get dio => ref.read(dioInstanceProvider);

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> body,
    required String endpoint,
  }) async {
    try {
      final response = await dio.post(endpoint, data: body);
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
