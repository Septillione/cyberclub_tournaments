import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
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
    on<AcceptRequestClicked>(_onAcceptRequest);
    on<RejectRequestClicked>(_onRejectRequest);
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
      final isMember = teamDetails.members.any(
        (m) => m.userId == currentUserId,
      );
      List<JoinRequestModel> joinRequests = [];
      if (isCaptain) {
        joinRequests = await _teamRepository.fetchJoinRequest(event.teamId);
      }
      emit(
        TeamDetailLoaded(
          team: teamDetails,
          isCaptain: isCaptain,
          isMember: isMember,
          joinRequests: joinRequests,
          currentUserId: currentUserId ?? '',
        ),
      );
    } catch (e) {
      emit(TeamDetailError(errorMessage: e.toString()));
    }
  }

  Future<void> _onAcceptRequest(
    AcceptRequestClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    try {
      await _teamRepository.acceptJoinRequest(event.requestId);

      if (state is TeamDetailLoaded) {
        final teamId = (state as TeamDetailLoaded).team.id;
        add(TeamDetailStarted(teamId: teamId));
      }
    } catch (e) {
      emit(TeamDetailError(errorMessage: e.toString()));
    }
  }

  Future<void> _onRejectRequest(
    RejectRequestClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    try {
      await _teamRepository.rejectJoinRequest(event.requestId);

      if (state is TeamDetailLoaded) {
        final teamId = (state as TeamDetailLoaded).team.id;
        add(TeamDetailStarted(teamId: teamId));
      }
    } catch (e) {
      emit(TeamDetailError(errorMessage: e.toString()));
    }
  }
}
