import 'package:cyberclub_tournaments/data/models/notification/notification_model.dart';
import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';

class NotificationMapper {
  static NotificationEntity toEntity(NotificationModel model) {
    return NotificationEntity(
      id: model.id,
      title: model.title,
      body: model.body,
      type: typeToEntity(model.type),
      data: model.data,
      isRead: model.isRead,
      createdAt: model.createdAt,
    );
  }

  static NotificationModel toModel(NotificationEntity entity) {
    return NotificationModel(
      id: entity.id,
      title: entity.title,
      body: entity.body,
      type: typeToJson(entity.type),
      isRead: entity.isRead,
      createdAt: entity.createdAt,
    );
  }

  static NotificationType typeToEntity(String type) {
    switch (type) {
      case 'INVITE':
        return NotificationType.invite;
      case 'MATCH':
        return NotificationType.match;
      case 'INFO':
        return NotificationType.info;
      case 'SYSTEM':
      default:
        return NotificationType.system;
    }
  }

  static String typeToJson(NotificationType type) {
    switch (type) {
      case NotificationType.invite:
        return 'INVITE';
      case NotificationType.match:
        return 'MATCH';
      case NotificationType.info:
        return 'INFO';
      case NotificationType.system:
        return 'SYSTEM';
    }
  }
}
