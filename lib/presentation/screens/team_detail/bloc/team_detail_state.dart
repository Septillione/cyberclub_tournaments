part of 'team_detail_bloc.dart';

abstract class TeamDetailState extends Equatable {
  const TeamDetailState();

  @override
  List<Object?> get props => [];
}

class TeamDetailLoading extends TeamDetailState {}

class TeamDetailLoaded extends TeamDetailState {
  final TeamEntity team;
  final bool isCaptain;
  final bool isMember;
  final List<JoinRequestEntity> joinRequests;
  final String currentUserId;

  const TeamDetailLoaded({
    required this.team,
    required this.isCaptain,
    required this.isMember,
    this.joinRequests = const [],
    required this.currentUserId,
  });

  @override
  List<Object?> get props => [
    team,
    isCaptain,
    isMember,
    joinRequests,
    currentUserId,
  ];
}

class TeamDetailError extends TeamDetailState {
  final String errorMessage;

  const TeamDetailError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
