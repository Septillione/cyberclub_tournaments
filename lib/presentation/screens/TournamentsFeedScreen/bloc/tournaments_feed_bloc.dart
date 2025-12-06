import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tournaments_feed_event.dart';
part 'tournaments_feed_state.dart';

class TournamentsFeedBloc
    extends Bloc<TournamentsFeedEvent, TournamentsFeedState> {
  final TournamentRepository _tournamentRepository;

  TournamentsFeedBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(TournamentsFeedLoading()) {
    on<TournamentsFeedStarted>(_onStarted);
    on<TournamentsFeedFilterChanged>(_onFilterChanged);
    on<TournamentsFeedRefreshed>(_onRefreshTournaments);
  }

  Future<void> _onStarted(
    TournamentsFeedStarted event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    emit(TournamentsFeedLoading());
    try {
      final allTournaments = await _tournamentRepository.fetchTournaments();
      final disciplines = _tournamentRepository.getDisciplines();

      emit(
        TournamentsFeedLoaded(
          allTournaments: allTournaments,
          filteredTournaments: allTournaments,
          disciplines: disciplines,
          selectedDiscipline: null,
        ),
      );
    } catch (e) {
      emit(TournamentsFeedError(errorMessage: e.toString()));
    }
  }

  void _onFilterChanged(
    TournamentsFeedFilterChanged event,
    Emitter<TournamentsFeedState> emit,
  ) {
    final currentState = state;
    if (currentState is TournamentsFeedLoaded) {
      final filteredList = event.selectedDiscipline == null
          ? currentState.allTournaments
          : currentState.allTournaments
                .where((t) => t.discipline == event.selectedDiscipline)
                .toList();
      emit(
        TournamentsFeedLoaded(
          allTournaments: currentState.allTournaments,
          filteredTournaments: filteredList,
          disciplines: currentState.disciplines,
          selectedDiscipline: event.selectedDiscipline,
        ),
      );
    }
  }

  Future<void> _onRefreshTournaments(
    TournamentsFeedRefreshed event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    final currentState = state;
    Discipline? currentFilter;
    if (currentState is TournamentsFeedLoaded) {
      currentFilter = currentState.selectedDiscipline;
    }

    try {
      final allTournaments = await _tournamentRepository.fetchTournaments();
      final disciplines = _tournamentRepository.getDisciplines();

      final filteredList = currentFilter == null
          ? allTournaments
          : allTournaments.where((t) => t.discipline == currentFilter).toList();

      emit(
        TournamentsFeedLoaded(
          allTournaments: allTournaments,
          filteredTournaments: filteredList,
          disciplines: disciplines,
          selectedDiscipline: currentFilter,
        ),
      );
      print('Данные были обновлены');
    } catch (e) {
      print('Ошибка обновления $e');
    }
  }
}
