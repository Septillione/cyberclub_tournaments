import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class RejectJoinRequestUseCase {
  final TeamRepository _repository;
  RejectJoinRequestUseCase(this._repository);

  Future<void> call(String requestId) =>
      _repository.rejectJoinRequest(requestId);
}
