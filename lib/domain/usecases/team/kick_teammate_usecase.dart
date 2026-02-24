import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class KickTeammateUseCase {
  final TeamRepository _repository;
  KickTeammateUseCase(this._repository);

  Future<void> call(String teamId, String userId) =>
      _repository.kickTeammate(teamId, userId);
}
