import 'package:cyberclub_tournaments/domain/repositories/notification_repository.dart';

class AcceptInviteUsecase {
  final NotificationRepository _repository;

  AcceptInviteUsecase(this._repository);

  Future<void> call(String requestId) => _repository.acceptInvite(requestId);
}
