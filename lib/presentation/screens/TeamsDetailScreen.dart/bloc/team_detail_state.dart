part of 'team_detail_bloc.dart';

sealed class TeamDetailState extends Equatable {
  const TeamDetailState();
  @override
  List<Object> get props => [];
}

final class TeamDetailLoading extends TeamDetailState {}

final class TeamDetailLoaded extends TeamDetailState {
  final TeamDetailModel team;
  
  const TeamDetailLoaded({required this.team});

  @override
  List<Object> get props => [team];
}

final class TeamDetailError extends TeamDetailState {
  final String errorMessage;

  const TeamDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
