part of 'tournaments_feed_bloc.dart';

abstract class TournamentsFeedEvent extends Equatable {
  const TournamentsFeedEvent();

  @override
  List<Object?> get props => [];
}

class TournamentsFeedStarted extends TournamentsFeedEvent {}

class TournamentsFeedRefreshed extends TournamentsFeedEvent {
  final TournamentFilter newFilter;

  const TournamentsFeedRefreshed(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}

class TournamentFilterUpdated extends TournamentsFeedEvent {
  final TournamentFilter newFilter;

  const TournamentFilterUpdated(this.newFilter);

  @override
  List<Object?> get props => [newFilter];
}

class TournamentSearchChanged extends TournamentsFeedEvent {
  final String query;

  const TournamentSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}
