import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class UpdateUserProfileUseCase {
  final UserRepository _repository;
  UpdateUserProfileUseCase(this._repository);

  Future<void> call({String? nickname, String? bio, String? avatarUrl}) =>
      _repository.updateUserProfile(
        nickname: nickname,
        bio: bio,
        avatarUrl: avatarUrl,
      );
}
