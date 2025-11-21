import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_detail__event.dart';
part 'team_detail_state.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  final TeamRepository _teamRepository;
  TeamDetailBloc({required TeamRepository teamRepository})
    : _teamRepository = teamRepository,
      super(TeamDetailLoading()) {
    on<TeamDetailStarted>(_onStarted);
  }

  Future<void> _onStarted(
    TeamDetailStarted event,
    Emitter<TeamDetailState> emit,
  ) async {
    emit(TeamDetailLoading());
    try {
      final teamDetails = await _teamRepository.fetchTeamDetails(event.teamId);
      emit(TeamDetailLoaded(team: teamDetails));
    } catch (e) {
      emit(TeamDetailError(errorMessage: e.toString()));
    }
  }
}
