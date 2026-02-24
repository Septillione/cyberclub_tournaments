import 'package:cyberclub_tournaments/datanew/datasources/auth_local_datasource.dart';
import 'package:dio/dio.dart';

class ApiClient {
  // static const String _baseUrl = 'https://cctournaments.ccmanager.ru/api/v1';
  static const String _baseUrl = 'http://10.0.2.2:3000/api/v1';

  // static const String _localIp = 'http://192.168.1.42:3000/api/v1';

  final Dio _dio;
  final AuthLocalDataSource _localDataSource;

  final void Function(String message)? onBanned;
  final void Function()? onUnauthorized;

  ApiClient({
    required AuthLocalDataSource localDataSource,
    this.onBanned,
    this.onUnauthorized,
  }) : _localDataSource = localDataSource,
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
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _localDataSource.getAccessToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 403) {
            final message = error.response?.data['message'] as String? ?? '';

            if (message.contains('заблокирован')) {
              await _localDataSource.clearTokens();
              // AppRouter.router.go('/ban', extra: message);
              onBanned?.call(message);
            }
          }

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
              await _localDataSource.clearTokens();
              onUnauthorized?.call();
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await _localDataSource.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final dio = Dio(BaseOptions(baseUrl: _baseUrl));
      // final dio = Dio(BaseOptions(baseUrl: _localIp));

      final response = await dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final newAt = response.data['accessToken'] as String;
      final newRt = response.data['refreshToken'] as String;

      await _localDataSource.saveTokens(
        accessToken: newAt,
        refreshToken: newRt,
      );

      return newAt;
    } catch (e) {
      await _localDataSource.clearTokens();
      return null;
    }
  }

  Dio get dio => _dio;
}
