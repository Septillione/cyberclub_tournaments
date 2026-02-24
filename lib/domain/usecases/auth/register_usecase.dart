import 'package:cyberclub_tournaments/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);

  Future<void> call({
    required String email,
    required String password,
    required String nickname,
  }) => _repository.register(
    email: email,
    password: password,
    nickname: nickname,
  );
}
