import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class LeaveTeamUseCase {
  final TeamRepository _repository;
  LeaveTeamUseCase(this._repository);

  Future<void> call(String teamId) => _repository.leaveTeam(teamId);
}
