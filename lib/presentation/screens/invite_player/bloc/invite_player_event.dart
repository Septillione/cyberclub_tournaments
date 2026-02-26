part of 'invite_player_bloc.dart';

abstract class InvitePlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InviteStarted extends InvitePlayerEvent {}

class InviteSearchQueryChanged extends InvitePlayerEvent {
  final String query;

  InviteSearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class InviteUserClicked extends InvitePlayerEvent {
  final String teamId;
  final String userId;

  InviteUserClicked({required this.teamId, required this.userId});

  @override
  List<Object?> get props => [teamId, userId];
}
