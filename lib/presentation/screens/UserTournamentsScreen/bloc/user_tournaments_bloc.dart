import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_tournaments_state.dart';
part 'user_tournaments_event.dart';

class UserTournamentsBloc
    extends Bloc<UserTournamentsEvent, UserTournamentsState> {
  final TournamentRepository _tournamentRepository;
  final AuthRepository _authRepository;

  UserTournamentsBloc({
    required TournamentRepository tournamentRepository,
    required AuthRepository authRepository,
  }) : _tournamentRepository = tournamentRepository,
       _authRepository = authRepository,
       super(UserTournamentsLoading()) {
    on<UserTournamentsStarted>(_onStarted);
    on<UserTournamentsRefreshed>(_onRefresheUserTournaments);
  }

  Future<void> _onStarted(
    UserTournamentsStarted event,
    Emitter<UserTournamentsState> state,
  ) async {
    emit(UserTournamentsLoading());
    try {
      final userTournaments = await _tournamentRepository
          .fetchUserTournaments();

      final now = DateTime.now();
      final List<TournamentModel> active = [];
      final List<TournamentModel> upcoming = [];
      final List<TournamentModel> finished = [];
      final currentUserId = await _authRepository.getUserId();

      for (final tournament in userTournaments) {
        if (tournament.status == TournamentStatus.LIVE) {
          active.add(tournament);
        } else if (tournament.status == TournamentStatus.FINISHED ||
            tournament.status == TournamentStatus.CANCELLED) {
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
          currentUserId: currentUserId ?? '',
        ),
      );
    } on AppException catch (e) {
      emit(UserTournamentsError(errorMessage: e.message));
    } catch (e) {
      emit(UserTournamentsError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onRefresheUserTournaments(
    UserTournamentsRefreshed event,
    Emitter<UserTournamentsState> emit,
  ) async {
    try {
      final userTournaments = await _tournamentRepository
          .fetchUserTournaments();

      final now = DateTime.now();
      final List<TournamentModel> active = [];
      final List<TournamentModel> upcoming = [];
      final List<TournamentModel> finished = [];
      final currentUserId = await _authRepository.getUserId();

      for (final tournament in userTournaments) {
        if (tournament.status == TournamentStatus.LIVE) {
          active.add(tournament);
        } else if (tournament.status == TournamentStatus.FINISHED ||
            tournament.status == TournamentStatus.CANCELLED) {
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
          currentUserId: currentUserId ?? '',
        ),
      );
    } on AppException catch (e) {
      emit(UserTournamentsError(errorMessage: e.message));
    } catch (e) {
      emit(UserTournamentsError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
