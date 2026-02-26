import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_tournaments_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';

part 'tournaments_feed_event.dart';
part 'tournaments_feed_state.dart';

const _debounceDuration = Duration(milliseconds: 500);

EventTransformer<Event> _debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class TournamentsFeedBloc
    extends Bloc<TournamentsFeedEvent, TournamentsFeedState> {
  final FetchTournamentsUsecase _getTournaments;

  TournamentsFeedBloc({required FetchTournamentsUsecase getTournaments})
    : _getTournaments = getTournaments,
      super(TournamentsFeedLoading()) {
    on<TournamentsFeedStarted>(_onStarted);
    on<TournamentFilterUpdated>(_onFilterUpdated);
    on<TournamentsFeedRefreshed>(_onRefresh);
    on<TournamentSearchChanged>(
      _onSearchChanged,
      transformer: _debounce(_debounceDuration),
    );
  }

  Future<void> _onStarted(
    TournamentsFeedStarted event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    await _loadTournaments(emit, const TournamentFilter());
  }

  Future<void> _onFilterUpdated(
    TournamentFilterUpdated event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    await _loadTournaments(emit, event.newFilter);
  }

  Future<void> _onRefresh(
    TournamentsFeedRefreshed event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    await _loadTournaments(emit, event.newFilter);
  }

  Future<void> _onSearchChanged(
    TournamentSearchChanged event,
    Emitter<TournamentsFeedState> emit,
  ) async {
    final current = state;
    final filter = current is TournamentsFeedLoaded
        ? current.currentFilter
        : const TournamentFilter();

    await _loadTournaments(emit, filter.copyWith(searchQuery: event.query));
  }

  Future<void> _loadTournaments(
    Emitter<TournamentsFeedState> emit,
    TournamentFilter filter,
  ) async {
    if (state is! TournamentsFeedLoaded) emit(TournamentsFeedLoading());

    try {
      final tournaments = await _getTournaments(filter);
      emit(
        TournamentsFeedLoaded(tournaments: tournaments, currentFilter: filter),
      );
    } on AppException catch (e) {
      emit(TournamentsFeedError(errorMessage: e.message));
    } catch (_) {
      emit(
        const TournamentsFeedError(
          errorMessage: 'Не удалось загрузить турниры',
        ),
      );
    }
  }
}
