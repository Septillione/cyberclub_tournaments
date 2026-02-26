import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // static const _storage = FlutterSecureStorage();
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _keyAccessToken, value: accessToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    // return await _storage.read(key: _keyAccessToken);
    print("STORAGE: Пытаюсь прочитать токен..."); // <--- ЛОГ
    try {
      final token = await _storage.read(key: _keyAccessToken);
      print("STORAGE: Токен прочитан: ${token != null}"); // <--- ЛОГ
      return token;
    } catch (e) {
      print("STORAGE ERROR: $e"); // <--- ЛОГ
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }
}
