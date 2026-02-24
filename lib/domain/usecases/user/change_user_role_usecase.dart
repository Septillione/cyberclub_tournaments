import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class ChangeUserRoleUseCase {
  final UserRepository _repository;
  ChangeUserRoleUseCase(this._repository);

  Future<void> call(String userId, UserRole role) =>
      _repository.changeUserRole(userId, role);
}
