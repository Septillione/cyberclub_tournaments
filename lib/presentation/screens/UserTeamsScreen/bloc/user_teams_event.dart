part of 'user_teams_bloc.dart';

@immutable
abstract class UserTeamsEvent extends Equatable {
  const UserTeamsEvent();

  @override
  List<Object> get props => [];
}

class UserTeamsStarted extends UserTeamsEvent {}

class UserTeamsSearchQueryChanged extends UserTeamsEvent {
  final String query;
  // final bool isSearching;

  const UserTeamsSearchQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}

class UserTeamsSearchJoinRequested extends UserTeamsEvent {
  final String teamId;

  const UserTeamsSearchJoinRequested(this.teamId);

  @override
  List<Object> get props => [teamId];
}

class UserTeamsRefreshed extends UserTeamsEvent {}
