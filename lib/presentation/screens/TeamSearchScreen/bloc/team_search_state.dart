part of 'team_search_bloc.dart';

sealed class TeamSearchState extends Equatable {
  const TeamSearchState();

  @override
  List<Object> get props => [];
}

class TeamSearchInitial extends TeamSearchState {}

class TeamSearchLoading extends TeamSearchState {}

class TeamSearchLoaded extends TeamSearchState {
  final List<TeamModel> teams;
  final String currentUserId;
  final String? successMessage;

  const TeamSearchLoaded({
    required this.teams,
    required this.currentUserId,
    this.successMessage,
  });

  @override
  List<Object> get props => [teams, currentUserId, ?successMessage];
}

class TeamSearchError extends TeamSearchState {
  final String errorMessage;

  const TeamSearchError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
