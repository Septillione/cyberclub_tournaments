import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class FetchTeamDetailsUsecase {
  final TeamRepository _repository;

  FetchTeamDetailsUsecase(this._repository);

  Future<TeamEntity> call(String teamId) {
    return _repository.fetchTeamDetails(teamId);
  }
}
