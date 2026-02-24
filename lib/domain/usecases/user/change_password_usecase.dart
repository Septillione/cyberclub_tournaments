import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class ChangePasswordUseCase {
  final UserRepository _repository;
  ChangePasswordUseCase(this._repository);

  Future<void> call(String oldPassword, String newPassword) =>
      _repository.changePassword(oldPassword, newPassword);
}
