import 'package:cyberclub_tournaments/data/models/auth/auth_dto.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/data/services/token_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  // Поля класса
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;

  // Конструктор с DI
  AuthRepository({
    required ApiClient apiClient,
    required TokenStorage tokenStorage,
  }) : _apiClient = apiClient,
       _tokenStorage = tokenStorage;

  // Логин
  Future<void> login(String email, String password) async {
    final response = await _apiClient.dio.post(
      '/auth/login',
      data: LoginRequest(email: email, password: password).toJson(),
    );

    final accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];

    await _tokenStorage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  // Регистрация
  Future<void> register({
    required String nickname,
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.dio.post(
      '/auth/register',
      data: RegisterRequest(
        nickname: nickname,
        email: email,
        password: password,
      ).toJson(),
    );

    final accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];

    await _tokenStorage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  // Выход
  Future<void> logout() async {
    await _tokenStorage.clearTokens();
  }

  // Проверка авторизации
  Future<bool> isLoggedIn() async {
    final token = await _tokenStorage.getAccessToken();
    print('Auth_repo: token from storage $token');

    if (token == null) {
      print('Auth_repo: token is null');
      return false;
    }
    final isExpired = JwtDecoder.isExpired(token);
    print('Auth_repo: is expired? $isExpired');

    return !isExpired;
    // return token != null && !JwtDecoder.isExpired(token);
  }

  // Узнать роль
  Future<String?> getRole() async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return null;

    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['role'];
  }

  // Узнать ID
  Future<String?> getUserId() async {
    final token = await _tokenStorage.getAccessToken();
    if (token == null) return null;

    final decodedToken = JwtDecoder.decode(token);
    return decodedToken['sub'];
  }
}
