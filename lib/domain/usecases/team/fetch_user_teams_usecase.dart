import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class FetchUserTeamsUsecase {
  final TeamRepository _repository;

  FetchUserTeamsUsecase(this._repository);

  Future<List<TeamEntity>> call() {
    return _repository.fetchUserTeams();
  }
}
