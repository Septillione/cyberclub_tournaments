abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register({
    required String nickname,
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<String?> getRole();
  Future<String?> getUserId();
}
