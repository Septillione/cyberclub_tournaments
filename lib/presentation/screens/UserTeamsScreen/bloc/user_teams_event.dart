part of 'user_teams_bloc.dart';

@immutable
abstract class UserTeamsEvent extends Equatable {
  const UserTeamsEvent();

  @override
  List<Object> get props => [];
}

class UserTeamsStarted extends UserTeamsEvent {}
