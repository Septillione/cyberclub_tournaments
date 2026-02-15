import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'user_teams_event.dart';
part 'user_teams_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class UserTeamsBloc extends Bloc<UserTeamsEvent, UserTeamsState> {
  final TeamRepository _teamRepository;
  final AuthRepository _authRepository;

  UserTeamsBloc({
    required TeamRepository teamRepository,
    required AuthRepository authRepository,
  }) : _teamRepository = teamRepository,
       _authRepository = authRepository,
       super(UserTeamsLoading()) {
    on<UserTeamsStarted>(_onStarted);
    on<TeamsSearchStarted>(_onSearchStarted);
    on<TeamsSearchQueryChanged>(
      _onQueryChanged,
      transformer: debounce(_duration),
    );
    on<TeamsSearchJoinRequested>(_onJoinRequested);
    on<UserTeamsRefreshed>(_onRefreshed);
    // on<UserTeamsStarted>(_onStarted);
    // on<UserTeamsSearchQueryChanged>(
    //   _onQueryChanged,
    //   transformer: debounce(_duration),
    // );
    // on<UserTeamsSearchJoinRequested>(_onJoinRequested);
    // on<UserTeamsRefreshed>(_onRefreshed);
  }

  Future<void> _onStarted(
    UserTeamsStarted event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final List<TeamModel> teams = await _teamRepository.fetchUserTeams();
      final currentUserId = await _authRepository.getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (e) {
      emit(UserTeamsError('Что-то пошло не так'));
    }
  }

  Future<void> _onSearchStarted(
    TeamsSearchStarted event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final teams = await _teamRepository.searchTeams('');
      final currentUserId = await _authRepository.getUserId();

      emit(UserTeamsLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (e) {
      emit(UserTeamsError('Что-то пошло не так'));
    }
  }

  Future<void> _onQueryChanged(
    TeamsSearchQueryChanged event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final teams = await _teamRepository.searchTeams(event.query);
      final currentUserId = await _authRepository.getUserId();

      emit(UserTeamsLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (e) {
      emit(UserTeamsError('Что-то пошло не так'));
    }
  }

  Future<void> _onJoinRequested(
    TeamsSearchJoinRequested event,
    Emitter<UserTeamsState> emit,
  ) async {
    final currentUserId = await _authRepository.getUserId();
    final currentState = state;
    if (currentState is UserTeamsLoaded) {
      try {
        await _teamRepository.sendJoinRequest(event.teamId);
        emit(
          UserTeamsLoaded(
            teams: currentState.teams,
            currentUserId: currentUserId ?? '',
            successMessage: 'Заявка отправлена!',
          ),
        );
        emit(
          UserTeamsLoaded(
            teams: currentState.teams,
            currentUserId: currentUserId ?? '',
            successMessage: null,
          ),
        );
      } on AppException catch (e) {
        emit(UserTeamsError(e.message));
      } catch (e) {
        emit(UserTeamsError('Что-то пошло не так'));
      }
    }
  }

  Future<void> _onRefreshed(
    UserTeamsRefreshed event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final List<TeamModel> teams = await _teamRepository.fetchUserTeams();
      final currentUserId = await _authRepository.getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (e) {
      emit(UserTeamsError('Что-то пошло не так'));
    }
  }
}
