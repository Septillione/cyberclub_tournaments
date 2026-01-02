part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notifications;

  const NotificationLoaded({required this.notifications});

  @override
  List<Object> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String errorMessage;

  const NotificationError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
