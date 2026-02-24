import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class UploadTeamLogoUseCase {
  final TeamRepository _repository;
  UploadTeamLogoUseCase(this._repository);

  Future<String?> call(String filePath) => _repository.uploadTeamLogo(filePath);
}
