// Логин запрос
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

// Регистрация запрос
class RegisterRequest {
  final String email;
  final String password;
  final String nickname;
  final String role;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.nickname,
    this.role = 'USER',
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'nickname': nickname,
    'role': role,
  };
}

// Ответ авторизации
class AuthResponse {
  final String accessToken;
  final String refreshToken;

  AuthResponse({required this.accessToken, required this.refreshToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
