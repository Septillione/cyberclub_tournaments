import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_detail__event.dart';
part 'team_detail_state.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  final TeamRepository _teamRepository;
  final AuthRepository _authRepository;

  TeamDetailBloc({
    required TeamRepository teamRepository,
    required AuthRepository authRepository,
  }) : _teamRepository = teamRepository,
       _authRepository = authRepository,
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
      final currentUserId = await _authRepository.getUserId();
      final isCaptain = teamDetails.ownerId == currentUserId;
      emit(
        TeamDetailLoaded(
          team: teamDetails,
          isCaptain: isCaptain,
          tournamentCount: 0,
        ),
      );
    } catch (e) {
      emit(TeamDetailError(errorMessage: e.toString()));
    }
  }
}
