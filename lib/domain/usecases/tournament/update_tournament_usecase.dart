import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class UpdateTournamentUsecase {
  final TournamentRepository _repository;

  UpdateTournamentUsecase(this._repository);

  Future<void> call(TournamentEntity tournament) {
    return _repository.updateTournament(tournament);
  }
}
