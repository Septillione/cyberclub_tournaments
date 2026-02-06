import 'package:cyberclub_tournaments/data/services/token_storage.dart';
import 'package:dio/dio.dart';

class ApiClient {
  // static const String _baseUrl = 'https://cctournaments.ccmanager.ru/api/v1';
  static const String _baseUrl = 'http://10.0.2.2:3000/api/v1';

  // static const String _localIp = 'http://192.168.1.42:3000/api/v1';

  final Dio _dio;
  final TokenStorage _tokenStorage;

  ApiClient({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage,
      _dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          // baseUrl: _localIp,
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
          print(
            'Interceptor: Token is ${token != null ? "PRESENT" : "NULL"}',
          ); // <--- Добавь это
          print('Interceptor: Path is ${options.path}');

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 &&
              !error.requestOptions.path.contains('auth')) {
            try {
              final newAccessToken = await _refreshToken();

              if (newAccessToken != null) {
                final options = error.requestOptions;
                options.headers['Authorization'] = 'Bearer $newAccessToken';

                final cloneReq = await _dio.request(
                  options.path,
                  options: Options(
                    method: options.method,
                    headers: options.headers,
                  ),
                  data: options.data,
                  queryParameters: options.queryParameters,
                );

                return handler.resolve(cloneReq);
              }
            } catch (e) {
              await _tokenStorage.clearTokens();
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final dio = Dio(BaseOptions(baseUrl: _baseUrl));
      // final dio = Dio(BaseOptions(baseUrl: _localIp));

      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final newAt = response.data['accessToken'];
      final newRt = response.data['refreshToken'];

      await _tokenStorage.saveTokens(accessToken: newAt, refreshToken: newRt);
      return newAt;
    } catch (e) {
      await _tokenStorage.clearTokens();
      return null;
    }
  }

  Dio get dio => _dio;
}
