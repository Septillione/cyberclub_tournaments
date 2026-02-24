import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class PromoteTeammateUseCase {
  final TeamRepository _repository;
  PromoteTeammateUseCase(this._repository);

  Future<void> call(String teamId, String userId) =>
      _repository.promoteTeammate(teamId, userId);
}
