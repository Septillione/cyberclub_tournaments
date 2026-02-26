part of 'user_teams_bloc.dart';

abstract class UserTeamsState extends Equatable {
  const UserTeamsState();

  @override
  List<Object?> get props => [];
}

class UserTeamsLoading extends UserTeamsState {}

class UserTeamsLoaded extends UserTeamsState {
  final List<TeamEntity> teams;
  final String currentUserId;
  final String? successMessage;

  const UserTeamsLoaded({
    required this.teams,
    required this.currentUserId,
    this.successMessage,
  });

  @override
  List<Object?> get props => [teams, currentUserId, successMessage];
}

class UserTeamsError extends UserTeamsState {
  final String errorMessage;

  const UserTeamsError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
