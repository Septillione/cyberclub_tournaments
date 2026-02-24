import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class AcceptJoinRequestUseCase {
  final TeamRepository _repository;
  AcceptJoinRequestUseCase(this._repository);

  Future<void> call(String requestId) =>
      _repository.acceptJoinRequest(requestId);
}
