part of 'team_detail_bloc.dart';

sealed class TeamDetailState extends Equatable {
  const TeamDetailState();
  @override
  List<Object> get props => [];
}

final class TeamDetailLoading extends TeamDetailState {}

final class TeamDetailLoaded extends TeamDetailState {
  final TeamModel team;
  final bool isCaptain;
  final bool isMember;
  final int tournamentCount;

  const TeamDetailLoaded({
    required this.team,
    required this.isCaptain,
    required this.isMember,
    this.tournamentCount = 0,
  });

  @override
  List<Object> get props => [team, isCaptain, isMember, tournamentCount];
}

final class TeamDetailError extends TeamDetailState {
  final String errorMessage;

  const TeamDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
