import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class UnbanUserUseCase {
  final UserRepository _repository;
  UnbanUserUseCase(this._repository);

  Future<void> call(String userId) => _repository.unbanUser(userId);
}
