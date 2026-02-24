import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/notification_repository.dart';

class FetchNotificationsUsecase {
  final NotificationRepository _repository;

  FetchNotificationsUsecase(this._repository);

  Future<List<NotificationEntity>> call() => _repository.fetchNotifications();
}
