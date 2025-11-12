import 'package:cyberclub_tournaments/data/models/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_teams_event.dart';
part 'user_teams_state.dart';

class UserTeamsBloc extends Bloc<UserTeamsEvent, UserTeamsState> {
  final TeamRepository _teamRepository;

  UserTeamsBloc({required TeamRepository teamRepository})
    : _teamRepository = teamRepository,
      super(UserTeamsLoading()) {
    on<UserTeamsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    UserTeamsEvent event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      const userId = 'current_user_id';
      final List<TeamListItemModel> teams = await _teamRepository.fetchUserTeams(
        userId,
      );
      emit(UserTeamsLoaded(teams: teams));
    } catch (e) {
      emit(UserTeamsError(e.toString()));
    }
  }
}
