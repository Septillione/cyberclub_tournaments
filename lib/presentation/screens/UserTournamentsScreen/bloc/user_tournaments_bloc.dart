import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_tournaments_state.dart';
part 'user_tournaments_event.dart';

class UserTournamentsBloc
    extends Bloc<UserTournamentsEvent, UserTournamentsState> {
  final TournamentRepository _tournamentRepository;

  UserTournamentsBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(UserTournamentsLoading()) {
    on<UserTournamentsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    UserTournamentsStarted event,
    Emitter<UserTournamentsState> state,
  ) async {
    emit(UserTournamentsLoading());
    try {
      const userId = 'currentUserId';
      final userTournaments = await _tournamentRepository.fetchUserTournaments(
        userId,
      );

      final now = DateTime.now();
      final List<TournamentModel> active = [];
      final List<TournamentModel> upcoming = [];
      final List<TournamentModel> finished = [];

      for (final tournament in userTournaments) {
        if (tournament.status == TournamentStatus.live) {
          active.add(tournament);
        } else if (tournament.status == TournamentStatus.finished ||
            tournament.status == TournamentStatus.cancelled) {
          finished.add(tournament);
        } else if (tournament.startDate.isAfter(now)) {
          upcoming.add(tournament);
        }
      }

      emit(
        UserTournamentsLoaded(
          activeTournaments: active,
          upcomingTournaments: upcoming,
          finishedTournaments: finished,
        ),
      );
    } catch (e) {
      emit(UserTournamentsError(errorMessage: e.toString()));
    }
  }
}
