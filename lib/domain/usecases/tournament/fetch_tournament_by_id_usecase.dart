import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class FetchTournamentByIdUsecase {
  final TournamentRepository _repository;

  FetchTournamentByIdUsecase(this._repository);

  Future<TournamentEntity?> call(String id) {
    return _repository.fetchTournamentById(id);
  }
}
