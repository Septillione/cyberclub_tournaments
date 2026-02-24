import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class UpdateMatchScoreUsecase {
  final TournamentRepository _repository;

  UpdateMatchScoreUsecase(this._repository);

  Future<void> call(String matchId, int score1, int score2) {
    return _repository.updateMatchScore(matchId, score1, score2);
  }
}
