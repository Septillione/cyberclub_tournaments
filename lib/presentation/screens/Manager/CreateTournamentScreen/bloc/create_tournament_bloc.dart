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
    on<CreateTournamentSubmitted>(_onCreateSubmitted);
    on<UpdateTournamentSubmitted>(_onUpdateSubmitted);
    on<CancelTournamentSubmitted>(_onCancelSubmitted);
  }

  Future<void> _onCreateSubmitted(
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

  Future<void> _onUpdateSubmitted(
    UpdateTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    try {
      await _tournamentRepository.updateTournament(
        event.id,
        event.title,
        event.description,
        event.rules,
        event.discipline,
        event.startDate,
        event.maxParticipants,
        event.bracketType,
        event.teamMode,
        event.isOnline,
        event.address,
        event.imageUrl,
        event.prizes,
      );
      print('Tournament was updated!');
      emit(CreateTournamentSuccess());
    } catch (e) {
      emit(CreateTournamentFailure(errorMessage: e.toString()));
      print('Error updating tournament: $e');
    }
  }

  Future<void> _onCancelSubmitted(
    CancelTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    emit(CreateTournamentLoading());
    try {
      await _tournamentRepository.cancelTournament(event.touranmentId);
      print('Tournament was cancelled!');
      emit(CreateTournamentSuccess());
    } catch (e) {
      print('Error cancelling tournament: $e');
      emit(CreateTournamentFailure(errorMessage: e.toString()));
    }
  }
}
