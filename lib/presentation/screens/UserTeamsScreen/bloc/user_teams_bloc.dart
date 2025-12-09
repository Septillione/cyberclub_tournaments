import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_teams_event.dart';
part 'user_teams_state.dart';

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
  }

  Future<void> _onStarted(
    UserTeamsEvent event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final List<TeamModel> teams = await _teamRepository.fetchUserTeams();
      final currentUserId = await _authRepository.getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } catch (e) {
      emit(UserTeamsError(e.toString()));
    }
  }
}
