import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class DisqualifyParticipantUsecase {
  final TournamentRepository _repository;

  DisqualifyParticipantUsecase(this._repository);

  Future<void> call(String matchId, int loserPosition) {
    return _repository.disqualifyParticipant(matchId, loserPosition);
  }
}
