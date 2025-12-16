part of 'team_detail_bloc.dart';

@immutable
abstract class TeamDetailEvent extends Equatable {
  const TeamDetailEvent();

  @override
  List<Object> get props => [];
}

class TeamDetailStarted extends TeamDetailEvent {
  final String teamId;
  const TeamDetailStarted({required this.teamId});
}

class KickPlayerClicked extends TeamDetailEvent {
  final String playerId;
  const KickPlayerClicked({required this.playerId});

  @override
  List<Object> get props => [playerId];
}

class AcceptApplicationClicked extends TeamDetailEvent {
  final String applicationId;
  const AcceptApplicationClicked({required this.applicationId});

  @override
  List<Object> get props => [applicationId];
}

class DeclineApplicationClicked extends TeamDetailEvent {
  final String applicationId;
  const DeclineApplicationClicked({required this.applicationId});

  @override
  List<Object> get props => [applicationId];
}

class TeamDetailJoinRequested extends TeamDetailEvent {
  final String teamId;

  const TeamDetailJoinRequested(this.teamId);

  @override
  List<Object> get props => [teamId];
}
