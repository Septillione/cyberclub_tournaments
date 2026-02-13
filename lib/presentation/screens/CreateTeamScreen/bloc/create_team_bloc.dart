import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  final TeamRepository _teamRepository;

  CreateTeamBloc({required TeamRepository teamRepository})
    : _teamRepository = teamRepository,
      super(CreateTeamInitial()) {
    on<CreateTeamSubmitted>(_onCreateTeamSubmitted);
    on<UpdateTeamSubmitted>(_onUpdateTeam);
  }

  Future<void> _onCreateTeamSubmitted(
    CreateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      await _teamRepository.createTeam(
        event.name,
        event.tag,
        event.description,
        event.socialMedia,
        event.gamesList,
        event.avatarUrl,
      );
      emit(CreateTeamSuccess());
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (e) {
      emit(CreateTeamFailure(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onUpdateTeam(
    UpdateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    try {
      await _teamRepository.updateTeam(
        event.teamId,
        event.name,
        event.tag,
        event.avatarUrl,
        event.description,
        event.socialMedia,
        event.gamesList,
      );
      print('Team was updated');
      emit(CreateTeamSuccess());
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (e) {
      emit(CreateTeamFailure(errorMessage: 'Что-то пошло не так'));
      print('Error updating team: $e');
    }
  }
}
