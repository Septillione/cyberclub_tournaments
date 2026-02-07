import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tournaments_feed_event.dart';
part 'tournaments_feed_state.dart';

const _duration = Duration(milliseconds: 500);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class TournamentsFeedBloc
    extends Bloc<TournamentsFeedEvent, TournamentsFeedState> {
  final TournamentRepository _tournamentRepository;

  TournamentsFeedBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(TournamentsFeedLoading()) {
    on<TournamentsFeedStarted>(_onStarted);
    on<TournamentFilterUpdated>(_onFilterUpdated);
    on<TournamentsFeedRefreshed>(_onRefreshTournaments);
    on<TouranmentFeedSearchChanged>(
      _onSearchChanged,
      transformer: debounce(_duration),
    );
  }

  Future<void> _onStarted(event, emit) async {
    emit(TournamentsFeedLoading());
    try {
      final tournaments = await _tournamentRepository.fetchTournaments(
        filter: const TournamentFilter(),
      );

      emit(
        TournamentsFeedLoaded(
          tournaments: tournaments,
          currentFilter: const TournamentFilter(),
        ),
      );
    } catch (e) {
      emit(TournamentsFeedError(errorMessage: e.toString()));
    }
  }

  Future<void> _onFilterUpdated(
    TournamentFilterUpdated event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    emit(TournamentsFeedLoading());
    try {
      final tournaments = await _tournamentRepository.fetchTournaments(
        filter: event.newFilter,
      );

      emit(
        TournamentsFeedLoaded(
          tournaments: tournaments,
          currentFilter: event.newFilter,
        ),
      );
    } catch (e) {
      emit(TournamentsFeedError(errorMessage: e.toString()));
    }
  }

  Future<void> _onRefreshTournaments(
    TournamentsFeedRefreshed event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    // final currentState = state;
    // Discipline? currentFilter;
    // if (currentState is TournamentsFeedLoaded) {
    //   currentFilter = currentState.currentFilter.discipline;
    // }

    try {
      // final allTournaments = await _tournamentRepository.fetchTournaments();
      // final disciplines = _tournamentRepository.getDisciplines();

      // final filteredList = currentFilter == null
      //     ? allTournaments
      //     : allTournaments.where((t) => t.discipline == currentFilter).toList();

      final tournaments = await _tournamentRepository.fetchTournaments(
        filter: event.newFilter,
      );

      emit(
        TournamentsFeedLoaded(
          tournaments: tournaments,
          currentFilter: event.newFilter,
        ),
      );
      print('Данные были обновлены');
    } catch (e) {
      print('Ошибка обновления $e');
    }
  }

  Future<void> _onSearchChanged(
    TouranmentFeedSearchChanged event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    final currentState = state;
    TournamentFilter currentFilter = const TournamentFilter();

    if (currentState is TournamentsFeedLoaded) {
      currentFilter = currentState.currentFilter;
    }

    final newFilter = currentFilter.copyWith(searchQuery: event.query);

    // emit(TournamentsFeedLoading());
    try {
      final tournaments = await _tournamentRepository.fetchTournaments(
        filter: newFilter,
      );

      emit(
        TournamentsFeedLoaded(
          tournaments: tournaments,
          currentFilter: newFilter,
        ),
      );
    } catch (e) {
      emit(TournamentsFeedError(errorMessage: e.toString()));
    }
  }
}
