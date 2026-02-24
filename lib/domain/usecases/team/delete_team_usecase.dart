import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class DeleteTeamUsecase {
  final TeamRepository _repository;

  DeleteTeamUsecase(this._repository);

  Future<void> call(String teamId) {
    return _repository.deleteTeam(teamId);
  }
}
