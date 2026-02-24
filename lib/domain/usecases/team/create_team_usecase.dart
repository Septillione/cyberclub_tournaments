import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class CreateTeamUsecase {
  final TeamRepository _repository;
  CreateTeamUsecase(this._repository);

  Future<void> call(TeamEntity team) => _repository.createTeam(team);
}
