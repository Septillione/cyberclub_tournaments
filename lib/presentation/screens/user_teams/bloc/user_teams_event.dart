part of 'user_teams_bloc.dart';

abstract class UserTeamsEvent extends Equatable {
  const UserTeamsEvent();

  @override
  List<Object?> get props => [];
}

class UserTeamsStarted extends UserTeamsEvent {}

class UserTeamsRefreshed extends UserTeamsEvent {}

class TeamsSearchStarted extends UserTeamsEvent {}

class TeamsSearchQueryChanged extends UserTeamsEvent {
  final String query;

  const TeamsSearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class TeamsSearchJoinRequested extends UserTeamsEvent {
  final String teamId;

  const TeamsSearchJoinRequested(this.teamId);

  @override
  List<Object?> get props => [teamId];
}
