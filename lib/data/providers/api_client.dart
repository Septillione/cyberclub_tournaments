import 'package:cyberclub_tournaments/data/services/token_storage.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static const String _baseUrl = 'http://cctournaments.ccmanager.ru/api/v1';

  final Dio _dio;
  final TokenStorage _tokenStorage;

  ApiClient({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage,
      _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _tokenStorage.getAccessToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
