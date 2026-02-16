import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'invite_player_event.dart';
part 'invite_player_state.dart';

const _duration = Duration(milliseconds: 500);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class InvitePlayerBloc extends Bloc<InvitePlayerEvent, InvitePlayerState> {
  final TeamRepository _teamRepository;

  InvitePlayerBloc({required TeamRepository teamRepository})
    : _teamRepository = teamRepository,
      super(const InvitePlayerState()) {
    on<InviteStarted>(_onStarted);

    on<InviteSearchQueryChanged>(
      _onSearchChanged,
      transformer: debounce(_duration),
    );
    on<InviteUserClicked>(_onInviteClicked);
  }

  Future<void> _onStarted(
    InviteStarted event,
    Emitter<InvitePlayerState> emit,
  ) async {
    emit(state.copyWith(status: InviteStatus.loading));
    try {
      final users = await _teamRepository.searchUser('');
      emit(state.copyWith(status: InviteStatus.success, users: users));
    } catch (e) {
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

    // if (event.query.length < 3) {
    //   emit(state.copyWith(users: [], status: InviteStatus.initial));
    //   return;
    // }

    emit(state.copyWith(status: InviteStatus.loading));
    try {
      final users = await _teamRepository.searchUser(event.query);
      emit(state.copyWith(status: InviteStatus.success, users: users));
    } catch (e) {
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
      await _teamRepository.inviteUserToTeam(event.teamId, event.userId);

      emit(state.copyWith(successMessage: 'Приглашение отправлено!'));

      emit(state.copyWith(successMessage: null));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Не удалось отправить приглашение'));
      emit(state.copyWith(errorMessage: ''));
    }
  }
}
