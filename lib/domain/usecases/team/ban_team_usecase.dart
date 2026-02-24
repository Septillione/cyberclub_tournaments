import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class BanTeamUseCase {
  final TeamRepository _repository;
  BanTeamUseCase(this._repository);

  Future<void> call(String teamId, bool isBanned) =>
      _repository.banTeam(teamId, isBanned);
}
