import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_tournament_bracket/flutter_tournament_bracket.dart';

part 'tournament_detail_event.dart';
part 'tournament_detail_state.dart';

class TournamentDetailBloc
    extends Bloc<TournamentDetailEvent, TournamentDetailState> {
  final TournamentRepository _tournamentRepository;
  final AuthRepository _authRepository;

  TournamentDetailBloc({
    required TournamentRepository tournamentRepository,
    required AuthRepository authRepository,
  }) : _tournamentRepository = tournamentRepository,
       _authRepository = authRepository,
       super(TournamentDetailLoading()) {
    on<TournamentDetailStarted>(_onStarted);
    on<TournamentRegisterRequested>(_onRegisterRequested);
    on<TournamentStartRequested>(_onStartRequested);
    on<MatchScoreUpdated>(_onScoreUpdated);
    on<MatchDisqualified>(_onDisqualified);
    on<TournamentFinishRequested>(_onFinishRequested);
  }

  Future<void> _onStarted(
    TournamentDetailStarted event,
    Emitter<TournamentDetailState> emit,
  ) async {
    emit(TournamentDetailLoading());
    try {
      final tournament = await _tournamentRepository.fetchTournamentById(
        event.tournamentId,
      );

      final currentUserId = await _authRepository.getUserId();

      if (tournament != null) {
        print(
          "DEBUG: Загружено матчей с сервера: ${tournament.matches.length}",
        );
        final rounds = _mapBracketMatchesToUI(tournament.matches);
        print("DEBUG: Сформировано раундов для сетки: ${rounds.length}");
        emit(
          TournamentDetailLoaded(
            tournament: tournament,
            bracketRounds: rounds,
            currentUserId: currentUserId ?? '',
          ),
        );
      } else {
        emit(TournamentDetailError(errorMessage: 'Турнир не найден'));
      }
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onRegisterRequested(
    TournamentRegisterRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TournamentDetailLoaded) return;

    try {
      emit(TournamentDetailLoading());

      await _tournamentRepository.joinTournament(
        currentState.tournament.id,
        teamId: event.teamId,
      );

      add(TournamentDetailStarted(tournamentId: currentState.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }

  List<Tournament> _mapBracketMatchesToUI(List<MatchModel> backendMatches) {
    if (backendMatches.isEmpty) return [];

    final matchesCopy = List<MatchModel>.from(backendMatches);
    matchesCopy.sort((a, b) => a.round.compareTo(b.round));

    final Map<int, List<MatchModel>> groupedByRound = {};

    for (var m in matchesCopy) {
      if (!groupedByRound.containsKey(m.round)) {
        groupedByRound[m.round] = [];
      }
      groupedByRound[m.round]!.add(m);
    }

    final List<Tournament> rounds = [];
    final roundNumbers = groupedByRound.keys.toList()..sort();

    for (var r in roundNumbers) {
      final matchesInRound = List<MatchModel>.from(groupedByRound[r]!);

      matchesInRound.sort((a, b) => a.position.compareTo(b.position));

      final uiMatches = matchesInRound.map((m) {
        return TournamentMatch(
          id: m.id,
          teamA: m.participant1 ?? "TBD",
          teamB: m.participant2 ?? "TBD",
          scoreTeamA: m.score1.toString(),
          scoreTeamB: m.score2.toString(),
        );
      }).toList();

      rounds.add(Tournament(matches: uiMatches));
    }

    return rounds;
  }

  Future<void> _onStartRequested(
    TournamentStartRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TournamentDetailLoaded) return;

    try {
      await _tournamentRepository.startTournament(currentState.tournament.id);
      add(TournamentDetailStarted(tournamentId: currentState.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onScoreUpdated(
    MatchScoreUpdated event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TournamentDetailLoaded) return;

    try {
      await _tournamentRepository.updateMatchScore(
        event.matchId,
        event.score1,
        event.score2,
      );
      add(TournamentDetailStarted(tournamentId: currentState.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onDisqualified(
    MatchDisqualified event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TournamentDetailLoaded) return;

    try {
      await _tournamentRepository.disqualifyParticipant(
        event.matchId,
        event.loserPosition,
      );
      add(TournamentDetailStarted(tournamentId: currentState.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onFinishRequested(
    TournamentFinishRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final currentState = state;
    if (currentState is! TournamentDetailLoaded) return;

    try {
      await _tournamentRepository.finishTournament(currentState.tournament.id);
      add(TournamentDetailStarted(tournamentId: currentState.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (e) {
      emit(TournamentDetailError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
