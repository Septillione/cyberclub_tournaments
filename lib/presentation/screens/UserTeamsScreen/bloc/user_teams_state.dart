part of 'user_teams_bloc.dart';

sealed class UserTeamsState extends Equatable {
  const UserTeamsState();

  @override
  List<Object> get props => [];
}

final class UserTeamsLoading extends UserTeamsState {}

final class UserTeamsLoaded extends UserTeamsState {
  final List<TeamModel> teams;
  final String currentUserId;

  const UserTeamsLoaded({required this.teams, required this.currentUserId});

  @override
  List<Object> get props => [teams, currentUserId];
}

final class UserTeamsError extends UserTeamsState {
  final String errorMessage;

  const UserTeamsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
