part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationStarted extends NotificationEvent {}

class NotificationRefreshed extends NotificationEvent {}

class NotificationAcceptInvite extends NotificationEvent {
  final String requestId;

  const NotificationAcceptInvite(this.requestId);

  @override
  List<Object?> get props => [requestId];
}

class NotificationDeclineInvite extends NotificationEvent {
  final String requestId;

  const NotificationDeclineInvite(this.requestId);

  @override
  List<Object?> get props => [requestId];
}
