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
  }

  Future<void> _onCreateTeamSubmitted(
    CreateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      await _teamRepository.createTeam(event.name, event.tag, event.avatarUrl);
      emit(CreateTeamSuccess());
    } catch (e) {
      emit(CreateTeamFailure(errorMessage: e.toString()));
    }
  }
}
