import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/fetch_notifications_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/accept_invite_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/decline_invite_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final FetchNotificationsUsecase _getNotifications;
  final AcceptInviteUsecase _acceptInvite;
  final DeclineInviteUseCase _declineInvite;

  NotificationBloc({
    required FetchNotificationsUsecase getNotifications,
    required AcceptInviteUsecase acceptInvite,
    required DeclineInviteUseCase declineInvite,
  }) : _getNotifications = getNotifications,
       _acceptInvite = acceptInvite,
       _declineInvite = declineInvite,
       super(NotificationLoading()) {
    on<NotificationStarted>(_onStarted);
    on<NotificationRefreshed>(_onRefresh);
    on<NotificationAcceptInvite>(_onAcceptInvite);
    on<NotificationDeclineInvite>(_onDeclineInvite);
  }

  Future<void> _onStarted(
    NotificationStarted event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationLoading());
    await _loadNotifications(emit);
  }

  Future<void> _onRefresh(
    NotificationRefreshed event,
    Emitter<NotificationState> emit,
  ) async {
    await _loadNotifications(emit);
  }

  Future<void> _onAcceptInvite(
    NotificationAcceptInvite event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await _acceptInvite(event.requestId);
      add(NotificationRefreshed());
    } on AppException catch (e) {
      emit(NotificationError(errorMessage: e.message));
    } catch (_) {
      emit(
        const NotificationError(errorMessage: 'Не удалось принять приглашение'),
      );
    }
  }

  Future<void> _onDeclineInvite(
    NotificationDeclineInvite event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await _declineInvite(event.requestId);
      add(NotificationRefreshed());
    } on AppException catch (e) {
      emit(NotificationError(errorMessage: e.message));
    } catch (_) {
      emit(
        const NotificationError(
          errorMessage: 'Не удалось отклонить приглашение',
        ),
      );
    }
  }

  // Приватный хелпер — загрузка списка
  Future<void> _loadNotifications(Emitter<NotificationState> emit) async {
    try {
      final notifications = await _getNotifications();
      emit(NotificationLoaded(notifications: notifications));
    } on AppException catch (e) {
      emit(NotificationError(errorMessage: e.message));
    } catch (_) {
      emit(
        const NotificationError(
          errorMessage: 'Не удалось загрузить уведомления',
        ),
      );
    }
  }
}
