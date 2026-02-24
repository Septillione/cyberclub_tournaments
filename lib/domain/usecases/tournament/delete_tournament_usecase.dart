import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class DeleteTournamentUsecase {
  final TournamentRepository _repository;

  DeleteTournamentUsecase(this._repository);

  Future<void> call(String tournamentId) {
    return _repository.deleteTournament(tournamentId);
  }
}
