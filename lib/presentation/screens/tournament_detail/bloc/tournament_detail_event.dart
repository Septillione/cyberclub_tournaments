part of 'tournament_detail_bloc.dart';

abstract class TournamentDetailEvent extends Equatable {
  const TournamentDetailEvent();

  @override
  List<Object?> get props => [];
}

class TournamentDetailStarted extends TournamentDetailEvent {
  final String tournamentId;

  const TournamentDetailStarted(this.tournamentId);

  @override
  List<Object?> get props => [tournamentId];
}

class TournamentRegisterRequested extends TournamentDetailEvent {
  final String? teamId;
  final List<String> rosterIds;

  const TournamentRegisterRequested({this.teamId, this.rosterIds = const []});

  @override
  List<Object?> get props => [teamId, rosterIds];
}

class TournamentStartRequested extends TournamentDetailEvent {}

class MatchScoreUpdated extends TournamentDetailEvent {
  final String matchId;
  final int score1;
  final int score2;

  const MatchScoreUpdated({
    required this.matchId,
    required this.score1,
    required this.score2,
  });

  @override
  List<Object?> get props => [matchId, score1, score2];
}

class MatchDisqualified extends TournamentDetailEvent {
  final String matchId;
  final int loserPosition;

  const MatchDisqualified({required this.matchId, required this.loserPosition});

  @override
  List<Object?> get props => [matchId, loserPosition];
}

class TournamentFinishRequested extends TournamentDetailEvent {}
