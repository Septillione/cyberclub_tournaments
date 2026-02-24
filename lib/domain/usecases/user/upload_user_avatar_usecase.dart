import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class UploadUserAvatarUseCase {
  final UserRepository _repository;
  UploadUserAvatarUseCase(this._repository);

  Future<String?> call(String filePath) =>
      _repository.uploadUserAvatar(filePath);
}
