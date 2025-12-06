part of 'tournament_detail_bloc.dart';

@immutable
abstract class TournamentDetailEvent extends Equatable {
  const TournamentDetailEvent();

  @override
  List<Object> get props => [];
}

class TournamentDetailStarted extends TournamentDetailEvent {
  final String tournamentId;

  const TournamentDetailStarted({required this.tournamentId});

  @override
  List<Object> get props => [tournamentId];
}
