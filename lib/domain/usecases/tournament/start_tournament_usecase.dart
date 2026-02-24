import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class StartTournamentUsecase {
  final TournamentRepository _repository;

  StartTournamentUsecase(this._repository);

  Future<void> call(String tournamentId) {
    return _repository.startTournament(tournamentId);
  }
}
