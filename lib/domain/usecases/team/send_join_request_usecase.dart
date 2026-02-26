import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class SendJoinRequestUseCase {
  final TeamRepository _repository;

  SendJoinRequestUseCase(this._repository);

  Future<void> call(String teamId) => _repository.sendJoinRequest(teamId);
}
