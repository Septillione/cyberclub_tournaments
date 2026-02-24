import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class FetchTournamentsUsecase {
  final TournamentRepository _repository;

  FetchTournamentsUsecase(this._repository);

  Future<List<TournamentEntity>> call(TournamentFilter? filter) {
    return _repository.fetchTournaments(filter: filter);
  }
}
