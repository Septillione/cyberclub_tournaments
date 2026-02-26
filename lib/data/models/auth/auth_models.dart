import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

class LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class RegisterRequestModel {
  final String email;
  final String password;
  final String nickname;
  final String role;

  RegisterRequestModel({
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

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String accessToken,
    required String refreshToken,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
