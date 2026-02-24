import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class BanUserUseCase {
  final UserRepository _repository;
  BanUserUseCase(this._repository);

  Future<void> call({
    required String userId,
    required String reason,
    int? days,
  }) => _repository.banUser(userId: userId, reason: reason, days: days);
}
