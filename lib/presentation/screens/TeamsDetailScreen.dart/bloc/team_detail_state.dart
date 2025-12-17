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
  final List<JoinRequestModel> joinRequests;
  final String currentUserId;

  const TeamDetailLoaded({
    required this.team,
    required this.isCaptain,
    required this.isMember,
    this.joinRequests = const [],
    required this.currentUserId,
  });

  @override
  List<Object> get props => [
    team,
    isCaptain,
    isMember,
    joinRequests,
    currentUserId,
  ];
}

final class TeamDetailError extends TeamDetailState {
  final String errorMessage;

  const TeamDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
