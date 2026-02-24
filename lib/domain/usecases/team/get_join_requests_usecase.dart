import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class GetJoinRequestsUseCase {
  final TeamRepository _repository;
  GetJoinRequestsUseCase(this._repository);

  Future<List<JoinRequestEntity>> call(String teamId) =>
      _repository.getJoinRequests(teamId);
}
