import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class CreateTournamentUsecase {
  final TournamentRepository _repository;

  CreateTournamentUsecase(this._repository);

  Future<void> call(TournamentEntity tournament) {
    return _repository.createTournament(tournament);
  }
}
