part of 'user_teams_bloc.dart';

sealed class UserTeamsState extends Equatable {
  const UserTeamsState();

  @override
  List<Object> get props => [];
}

final class UserTeamsLoading extends UserTeamsState {}

final class UserTeamsLoaded extends UserTeamsState {
  final List<TeamListItemModel> teams;

  const UserTeamsLoaded({required this.teams});

  @override
  List<Object> get props => [teams];
}

final class UserTeamsError extends UserTeamsState {
  final String errorMessage;

  const UserTeamsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
