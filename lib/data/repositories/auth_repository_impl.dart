import 'package:cyberclub_tournaments/data/datasources/auth_local_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/auth_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/models/auth/auth_models.dart';
import 'package:cyberclub_tournaments/domain/repositories/auth_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<void> login(String email, String password) async {
    final response = await _remoteDataSource.login(
      LoginRequestModel(email: email, password: password),
    );
    await _saveTokensFromResponse(response);
  }

  @override
  Future<void> register({
    required String nickname,
    required String email,
    required String password,
  }) async {
    final response = await _remoteDataSource.register(
      RegisterRequestModel(
        nickname: nickname,
        email: email,
        password: password,
      ),
    );
    await _saveTokensFromResponse(response);
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } finally {
      await _localDataSource.clearTokens();
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final token = await _localDataSource.getAccessToken();
      if (token == null) return false;
      return !JwtDecoder.isExpired(token);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getRole() async {
    try {
      final token = await _localDataSource.getAccessToken();
      if (token == null) return null;
      final decoded = JwtDecoder.decode(token);
      return decoded['role'] as String?;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getUserId() async {
    try {
      final token = await _localDataSource.getAccessToken();
      if (token == null) return null;
      final decoded = JwtDecoder.decode(token);
      return decoded['sub'] as String?;
    } catch (e) {
      return null;
    }
  }

  Future<void> _saveTokensFromResponse(AuthResponseModel response) async {
    await _localDataSource.saveTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }
}
