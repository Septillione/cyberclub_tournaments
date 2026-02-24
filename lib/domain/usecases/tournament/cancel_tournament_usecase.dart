import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class CancelTournamentUsecase {
  final TournamentRepository _repository;

  CancelTournamentUsecase(this._repository);

  Future<void> call(String tournamentId) {
    return _repository.cancelTournament(tournamentId);
  }
}
