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

class AcceptRequestClicked extends TeamDetailEvent {
  final String requestId;
  const AcceptRequestClicked({required this.requestId});

  @override
  List<Object> get props => [requestId];
}

class RejectRequestClicked extends TeamDetailEvent {
  final String requestId;
  const RejectRequestClicked({required this.requestId});

  @override
  List<Object> get props => [requestId];
}

class TeamDetailJoinRequested extends TeamDetailEvent {
  final String teamId;

  const TeamDetailJoinRequested(this.teamId);

  @override
  List<Object> get props => [teamId];
}
