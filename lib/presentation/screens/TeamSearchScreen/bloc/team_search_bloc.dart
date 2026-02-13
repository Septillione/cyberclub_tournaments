import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'team_search_event.dart';
part 'team_search_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class TeamSearchBloc extends Bloc<TeamSearchEvent, TeamSearchState> {
  final TeamRepository _teamRepository;
  final AuthRepository _authRepository;

  TeamSearchBloc({
    required TeamRepository teamRepository,
    required AuthRepository authRepository,
  }) : _teamRepository = teamRepository,
       _authRepository = authRepository,
       super(TeamSearchInitial()) {
    on<TeamSearchQueryChanged>(
      _onQueryChanged,
      transformer: debounce(_duration),
    );
    on<TeamSearchJoinRequested>(_onJoinRequested);
  }

  Future<void> _onQueryChanged(
    TeamSearchQueryChanged event,
    Emitter<TeamSearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(TeamSearchInitial());
      return;
    }

    emit(TeamSearchLoading());
    try {
      final teams = await _teamRepository.searchTeams(event.query);
      final currentUserId = await _authRepository.getUserId();

      emit(TeamSearchLoaded(teams: teams, currentUserId: currentUserId ?? ''));
    } on AppException catch (e) {
      emit(TeamSearchError(errorMessage: e.message));
    } catch (e) {
      emit(TeamSearchError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onJoinRequested(
    TeamSearchJoinRequested event,
    Emitter<TeamSearchState> emit,
  ) async {
    final currentUserId = await _authRepository.getUserId();
    final currentState = state;
    if (currentState is TeamSearchLoaded) {
      try {
        await _teamRepository.sendJoinRequest(event.teamId);
        emit(
          TeamSearchLoaded(
            teams: currentState.teams,
            currentUserId: currentUserId ?? '',
            successMessage: 'Заявка отправлена!',
          ),
        );
        emit(
          TeamSearchLoaded(
            teams: currentState.teams,
            currentUserId: currentUserId ?? '',
            successMessage: null,
          ),
        );
      } on AppException catch (e) {
        emit(TeamSearchError(errorMessage: e.message));
      } catch (e) {
        emit(TeamSearchError(errorMessage: 'Что-то пошло не так'));
      }
    }
  }
}
