import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class JoinTournamentUsecase {
  final TournamentRepository _repository;

  JoinTournamentUsecase(this._repository);

  Future<void> call(String tournamentId, {String? teamId}) {
    return _repository.joinTournament(tournamentId, teamId: teamId);
  }
}
