part of 'tournaments_feed_bloc.dart';

@immutable
abstract class TournamentsFeedEvent extends Equatable {
  const TournamentsFeedEvent();

  @override
  List<Object> get props => [];
}

class TournamentsFeedStarted extends TournamentsFeedEvent {}

// class TournamentsFeedFilterChanged extends TournamentsFeedEvent {
//   final Discipline? selectedDiscipline;

//   const TournamentsFeedFilterChanged(this.selectedDiscipline);

//   @override
//   List<Object> get props => [?selectedDiscipline];
// }

class TournamentsFeedRefreshed extends TournamentsFeedEvent {
  final TournamentFilter newFilter;

  const TournamentsFeedRefreshed(this.newFilter);

  @override
  List<Object> get props => [newFilter];
}

class TournamentFilterUpdated extends TournamentsFeedEvent {
  final TournamentFilter newFilter;

  const TournamentFilterUpdated(this.newFilter);
}

class TouranmentFeedSearchChanged extends TournamentsFeedEvent {
  final String query;

  const TouranmentFeedSearchChanged(this.query);

  @override
  List<Object> get props => [query];
}
