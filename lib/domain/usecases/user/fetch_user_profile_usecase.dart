import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class FetchUserProfileUsecase {
  final UserRepository _repository;

  FetchUserProfileUsecase(this._repository);

  Future<UserEntity> call(String userId) =>
      _repository.fetchUserProfile(userId);
}
