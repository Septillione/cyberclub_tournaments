import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class FetchOrganizedTournamentsUsecase {
  final TournamentRepository _repository;

  FetchOrganizedTournamentsUsecase(this._repository);

  Future<List<TournamentEntity>> call() {
    return _repository.fetchOrganizedTournaments();
  }
}
