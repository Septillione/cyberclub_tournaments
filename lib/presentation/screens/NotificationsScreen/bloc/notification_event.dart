part of 'notification_bloc.dart';

@immutable
class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationStarted extends NotificationEvent {}

class NotificationRefreshed extends NotificationEvent {}
