import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/v1';

  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

  Dio get dio => _dio;
}
