import 'package:cyberclub_tournaments/data/models/NotificationModel/notification_model.dart';
import 'package:cyberclub_tournaments/data/repositories/notification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository;

  NotificationBloc({required NotificationRepository notificationRepository})
    : _notificationRepository = notificationRepository,
      super(NotificationLoading()) {
    on<NotificationStarted>(_onStarted);
    on<NotificationRefreshed>(_onRefresh);
  }

  Future<void> _onStarted(
    NotificationStarted event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    try {
      final notifications = await _notificationRepository.fetchNotifications();
      emit(NotificationLoaded(notifications: notifications));
    } catch (e) {
      print("NOTIFICATIONS ERROR: $e");
      emit(NotificationError(errorMessage: e.toString()));
    }
  }

  Future<void> _onRefresh(
    NotificationRefreshed event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      final notifications = await _notificationRepository.fetchNotifications();
      emit(NotificationLoaded(notifications: notifications));
    } catch (e) {
      print("NOTIFICATIONS ERROR: $e");
      emit(NotificationError(errorMessage: e.toString()));
    }
  }
}
