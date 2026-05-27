import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class JoinTournamentUsecase {
  final TournamentRepository _repository;

  JoinTournamentUsecase(this._repository);

  Future<void> call(
    String tournamentId, {
    String? teamId,
    List<String>? rosterIds,
  }) {
    return _repository.joinTournament(
      tournamentId,
      teamId: teamId,
      rosterIds: rosterIds,
    );
  }
}
