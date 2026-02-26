part of 'team_detail_bloc.dart';

abstract class TeamDetailEvent extends Equatable {
  const TeamDetailEvent();

  @override
  List<Object?> get props => [];
}

class TeamDetailStarted extends TeamDetailEvent {
  final String teamId;

  const TeamDetailStarted({required this.teamId});

  @override
  List<Object?> get props => [teamId];
}

class AcceptRequestClicked extends TeamDetailEvent {
  final String requestId;

  const AcceptRequestClicked({required this.requestId});

  @override
  List<Object?> get props => [requestId];
}

class RejectRequestClicked extends TeamDetailEvent {
  final String requestId;

  const RejectRequestClicked({required this.requestId});

  @override
  List<Object?> get props => [requestId];
}

class TeamDetailPromoteTeammate extends TeamDetailEvent {
  final String teamId;
  final String userId;

  const TeamDetailPromoteTeammate({required this.teamId, required this.userId});

  @override
  List<Object?> get props => [teamId, userId];
}

class TeamDetailKickTeammate extends TeamDetailEvent {
  final String teamId;
  final String userId;

  const TeamDetailKickTeammate({required this.teamId, required this.userId});

  @override
  List<Object?> get props => [teamId, userId];
}

class TeamDetailLeaveClicked extends TeamDetailEvent {
  final String teamId;

  const TeamDetailLeaveClicked({required this.teamId});

  @override
  List<Object?> get props => [teamId];
}

class TeamDetailDeleteClicked extends TeamDetailEvent {
  final String teamId;

  const TeamDetailDeleteClicked({required this.teamId});

  @override
  List<Object?> get props => [teamId];
}
