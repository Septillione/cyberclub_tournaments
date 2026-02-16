part of 'invite_player_bloc.dart';

@immutable
abstract class InvitePlayerEvent extends Equatable {
  const InvitePlayerEvent();

  @override
  List<Object> get props => [];
}

class InviteStarted extends InvitePlayerEvent {}

class InviteSearchQueryChanged extends InvitePlayerEvent {
  final String query;
  const InviteSearchQueryChanged(this.query);
}

class InviteUserClicked extends InvitePlayerEvent {
  final String teamId;
  final String userId;

  const InviteUserClicked({required this.teamId, required this.userId});
}
