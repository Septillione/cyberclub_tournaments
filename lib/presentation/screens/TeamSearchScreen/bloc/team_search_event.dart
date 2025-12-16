part of 'team_search_bloc.dart';

sealed class TeamSearchEvent extends Equatable {
  const TeamSearchEvent();

  @override
  List<Object> get props => [];
}

class TeamSearchQueryChanged extends TeamSearchEvent {
  final String query;

  const TeamSearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class TeamSearchJoinRequested extends TeamSearchEvent {
  final String teamId;

  const TeamSearchJoinRequested(this.teamId);

  @override
  List<Object> get props => [teamId];
}

// class TeamSearchDetails extends TeamSearchEvent {
//   final String teamId;

//   const TeamSearchDetails(this.teamId);

//   @override
//   List<Object> get props => [teamId];
// }
