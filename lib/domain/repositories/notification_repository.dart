import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> fetchNotifications();
  Future<void> acceptInvite(String requestId);
  Future<void> declineInvite(String requestId);
}
