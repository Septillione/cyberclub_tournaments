import 'package:equatable/equatable.dart';

enum NotificationType {
  invite,
  match,
  system,
  info;

  String get title {
    switch (this) {
      case NotificationType.invite:
        return 'Приглашение';
      case NotificationType.match:
        return 'Матч';
      case NotificationType.system:
        return 'Системное';
      case NotificationType.info:
        return 'Информация';
    }
  }
}

class NotificationEntity extends Equatable {
  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final Map<String, dynamic>? data;
  final bool isRead;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.isRead,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, body, type, data, isRead, createdAt];
}
