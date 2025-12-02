import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  //Экземпляры хранилища
  static const _storage = FlutterSecureStorage();

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  // Сохранение токенов
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  // Получить Access Token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  // Получить Refresh Token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  // Удаление токенов
  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }
}
