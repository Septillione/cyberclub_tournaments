import 'package:cyberclub_tournaments/domain/repositories/auth_repository.dart';

class GetUserRoleUseCase {
  final AuthRepository _repository;
  GetUserRoleUseCase(this._repository);

  Future<String?> call() => _repository.getRole();
}
