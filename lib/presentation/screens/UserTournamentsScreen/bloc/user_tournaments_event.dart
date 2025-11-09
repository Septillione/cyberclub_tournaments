part of 'user_tournaments_bloc.dart';

@immutable
abstract class UserTournamentsEvent extends Equatable {
  const UserTournamentsEvent();

  @override
  List<Object> get props => [];
}

class UserTournamentsStarted extends UserTournamentsEvent {}
