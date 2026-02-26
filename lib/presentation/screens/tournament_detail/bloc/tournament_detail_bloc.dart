import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_tournament_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tournament_bracket/flutter_tournament_bracket.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/join_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/start_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/finish_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/update_match_score_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/disqualify_participant_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';

part 'tournament_detail_event.dart';
part 'tournament_detail_state.dart';

class TournamentDetailBloc
    extends Bloc<TournamentDetailEvent, TournamentDetailState> {
  final FetchTournamentByIdUsecase _getTournament;
  final JoinTournamentUsecase _joinTournament;
  final StartTournamentUsecase _startTournament;
  final FinishTournamentUsecase _finishTournament;
  final UpdateMatchScoreUsecase _updateMatchScore;
  final DisqualifyParticipantUsecase _disqualifyParticipant;
  final GetUserIdUseCase _getUserId;

  TournamentDetailBloc({
    required FetchTournamentByIdUsecase getTournament,
    required JoinTournamentUsecase joinTournament,
    required StartTournamentUsecase startTournament,
    required FinishTournamentUsecase finishTournament,
    required UpdateMatchScoreUsecase updateMatchScore,
    required DisqualifyParticipantUsecase disqualifyParticipant,
    required GetUserIdUseCase getUserId,
  }) : _getTournament = getTournament,
       _joinTournament = joinTournament,
       _startTournament = startTournament,
       _finishTournament = finishTournament,
       _updateMatchScore = updateMatchScore,
       _disqualifyParticipant = disqualifyParticipant,
       _getUserId = getUserId,
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
      final tournament = await _getTournament(event.tournamentId);
      final userId = await _getUserId();

      if (tournament != null) {
        final rounds = _mapBracketMatchesToUI(tournament.matches);
        emit(
          TournamentDetailLoaded(
            tournament: tournament,
            bracketRounds: rounds,
            currentUserId: userId ?? '',
          ),
        );
      } else {
        emit(const TournamentDetailError(errorMessage: 'Турнир не найден'));
      }
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (_) {
      emit(const TournamentDetailError(errorMessage: 'Ошибка загрузки'));
    }
  }

  Future<void> _onRegisterRequested(
    TournamentRegisterRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    final current = state;
    if (current is! TournamentDetailLoaded) return;

    try {
      emit(TournamentDetailLoading());
      await _joinTournament(current.tournament.id, teamId: event.teamId);
      add(TournamentDetailStarted(current.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (_) {
      emit(const TournamentDetailError(errorMessage: 'Не удалось вступить'));
    }
  }

  // Bracket mapper
  List<Tournament> _mapBracketMatchesToUI(List<MatchEntity> matches) {
    if (matches.isEmpty) return [];

    final matchesCopy = List<MatchEntity>.from(matches)
      ..sort((a, b) => a.round.compareTo(b.round));

    final groupedByRound = <int, List<MatchEntity>>{};
    for (var m in matchesCopy) {
      groupedByRound.putIfAbsent(m.round, () => []).add(m);
    }

    final rounds = <Tournament>[];
    final roundNumbers = groupedByRound.keys.toList()..sort();

    for (var r in roundNumbers) {
      final matchesInRound = List<MatchEntity>.from(groupedByRound[r]!)
        ..sort((a, b) => a.position.compareTo(b.position));

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

  // Actions
  Future<void> _onStartRequested(
    TournamentStartRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    await _performAction(
      () => _startTournament((state as TournamentDetailLoaded).tournament.id),
      emit,
    );
  }

  Future<void> _onFinishRequested(
    TournamentFinishRequested event,
    Emitter<TournamentDetailState> emit,
  ) async {
    await _performAction(
      () => _finishTournament((state as TournamentDetailLoaded).tournament.id),
      emit,
    );
  }

  Future<void> _onScoreUpdated(
    MatchScoreUpdated event,
    Emitter<TournamentDetailState> emit,
  ) async {
    await _performAction(
      () => _updateMatchScore(event.matchId, event.score1, event.score2),
      emit,
    );
  }

  Future<void> _onDisqualified(
    MatchDisqualified event,
    Emitter<TournamentDetailState> emit,
  ) async {
    await _performAction(
      () => _disqualifyParticipant(event.matchId, event.loserPosition),
      emit,
    );
  }

  Future<void> _performAction(
    Future<void> Function() action,
    Emitter<TournamentDetailState> emit,
  ) async {
    final current = state;
    if (current is! TournamentDetailLoaded) return;

    try {
      await action();
      add(TournamentDetailStarted(current.tournament.id));
    } on AppException catch (e) {
      emit(TournamentDetailError(errorMessage: e.message));
    } catch (_) {
      emit(const TournamentDetailError(errorMessage: 'Ошибка операции'));
    }
  }
}
