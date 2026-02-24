import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class UpdateTeamUseCase {
  final TeamRepository _repository;
  UpdateTeamUseCase(this._repository);

  Future<void> call(TeamEntity team) => _repository.updateTeam(team);
}
