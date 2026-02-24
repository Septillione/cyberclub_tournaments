import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class JoinTeamUseCase {
  final TeamRepository _repository;
  JoinTeamUseCase(this._repository);

  Future<void> call(String teamId) => _repository.joinTeam(teamId);
}
