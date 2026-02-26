import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class InviteUserUseCase {
  final TeamRepository _repository;

  InviteUserUseCase(this._repository);

  Future<void> call(String teamId, String userId) =>
      _repository.inviteUser(teamId, userId);
}
