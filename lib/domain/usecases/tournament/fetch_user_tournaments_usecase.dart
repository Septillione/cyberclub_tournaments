import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class FetchUserTournamentsUsecase {
  final TournamentRepository _repository;

  FetchUserTournamentsUsecase(this._repository);

  Future<List<TournamentEntity>> call() {
    return _repository.fetchUserTournaments();
  }
}
