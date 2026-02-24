import 'package:cyberclub_tournaments/domain/repositories/notification_repository.dart';

class DeclineInviteUseCase {
  final NotificationRepository _repository;

  DeclineInviteUseCase(this._repository);

  Future<void> call(String requestId) => _repository.declineInvite(requestId);
}
