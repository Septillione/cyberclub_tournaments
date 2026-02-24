import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class FinishTournamentUsecase {
  final TournamentRepository _repository;

  FinishTournamentUsecase(this._repository);

  Future<void> call(String tournamentId) {
    return _repository.finishTournament(tournamentId);
  }
}
