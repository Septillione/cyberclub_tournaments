import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/search_users_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/invite_user_usecase.dart';

part 'invite_player_event.dart';
part 'invite_player_state.dart';

const _debounceDuration = Duration(milliseconds: 500);

EventTransformer<Event> _debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class InvitePlayerBloc extends Bloc<InvitePlayerEvent, InvitePlayerState> {
  final SearchUsersUsecase _searchUsers;
  final InviteUserUseCase _inviteUser;

  InvitePlayerBloc({
    required SearchUsersUsecase searchUsers,
    required InviteUserUseCase inviteUser,
  }) : _searchUsers = searchUsers,
       _inviteUser = inviteUser,
       super(const InvitePlayerState()) {
    on<InviteStarted>(_onStarted);
    on<InviteSearchQueryChanged>(
      _onSearchChanged,
      transformer: _debounce(_debounceDuration),
    );
    on<InviteUserClicked>(_onInviteClicked);
  }

  Future<void> _onStarted(
    InviteStarted event,
    Emitter<InvitePlayerState> emit,
  ) async {
    emit(state.copyWith(status: InviteStatus.loading));
    try {
      final users = await _searchUsers('');
      emit(state.copyWith(status: InviteStatus.success, users: users));
    } catch (_) {
      emit(state.copyWith(status: InviteStatus.failure));
    }
  }

  Future<void> _onSearchChanged(
    InviteSearchQueryChanged event,
    Emitter<InvitePlayerState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(InviteStarted());
      return;
    }

    emit(state.copyWith(status: InviteStatus.loading));
    try {
      final users = await _searchUsers(event.query);
      emit(state.copyWith(status: InviteStatus.success, users: users));
    } catch (_) {
      emit(
        state.copyWith(
          status: InviteStatus.failure,
          errorMessage: 'Ошибка поиска',
        ),
      );
    }
  }

  Future<void> _onInviteClicked(
    InviteUserClicked event,
    Emitter<InvitePlayerState> emit,
  ) async {
    try {
      await _inviteUser(event.teamId, event.userId);
      emit(state.copyWith(successMessage: 'Приглашение отправлено!'));
      // Сбрасываем сообщение чтобы не показывалось повторно
      emit(state.copyWith(clearSuccess: true));
    } catch (_) {
      emit(state.copyWith(errorMessage: 'Не удалось отправить приглашение'));
      emit(state.copyWith(clearError: true));
    }
  }
}
