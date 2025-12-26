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
        final rounds = _mapBracketMatchesToUI(tournament.matches);
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
    } catch (e) {
      emit(TournamentDetailError(errorMessage: e.toString()));
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
    } catch (e) {
      emit(TournamentDetailError(errorMessage: e.toString()));
    }
  }

  List<Tournament> _mapBracketMatchesToUI(List<MatchModel> backendMatches) {
    if (backendMatches.isEmpty) return [];

    // backendMatches.sort((a, b) => a.round.compareTo(b.round));

    final sortedMathces = List<MatchModel>.from(backendMatches);
    sortedMathces.sort((a, b) => a.round.compareTo(b.round));

    final Map<int, List<MatchModel>> groupedByRound = {};

    for (var m in sortedMathces) {
      if (!groupedByRound.containsKey(m.round)) {
        groupedByRound[m.round] = [];
      }
      groupedByRound[m.round]!.add(m);
    }

    final List<Tournament> rounds = [];

    final roundNumbers = groupedByRound.keys.toList()..sort();

    for (var r in roundNumbers) {
      // final matchesInRound = groupedByRound[r]!;
      // matchesInRound.sort((a, b) => a.position.compareTo(b.position));

      final matchesInRound = groupedByRound[r]!.toList();
      matchesInRound.sort((a, b) => a.position.compareTo(b.position));

      final uiMatches = matchesInRound.map((m) {
        return TournamentMatch(
          id: m.id,
          teamA: m.participant1 ?? 'TBD',
          teamB: m.participant2 ?? 'TBD',
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
    } catch (e) {
      emit(TournamentDetailError(errorMessage: e.toString()));
    }
  }
}
