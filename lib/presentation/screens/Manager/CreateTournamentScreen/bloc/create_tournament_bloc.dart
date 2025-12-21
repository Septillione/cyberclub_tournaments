import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_tournament_state.dart';
part 'create_tournament_event.dart';

class CreateTournamentBloc
    extends Bloc<CreateTournamentEvent, CreateTournamentState> {
  final TournamentRepository _tournamentRepository;

  CreateTournamentBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(CreateTournamentInitial()) {
    on<CreateTournamentSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    CreateTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    emit(CreateTournamentLoading());
    try {
      await _tournamentRepository.createTournament(
        title: event.title,
        description: event.description,
        rules: event.rules,
        discipline: event.discipline,
        startDate: event.startDate,
        maxParticipants: event.maxParticipants,
        bracketType: event.bracketType,
        teamMode: event.teamMode,
        isOnline: event.isOnline,
        address: event.address,
        imageUrl: event.imageUrl,
        prizes: event.prizes,
      );
      emit(CreateTournamentSuccess());
    } catch (e) {
      emit(CreateTournamentFailure(errorMessage: e.toString()));
    }
  }
}
