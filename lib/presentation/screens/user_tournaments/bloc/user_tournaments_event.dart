part of 'user_tournaments_bloc.dart';

abstract class UserTournamentsEvent extends Equatable {
  const UserTournamentsEvent();

  @override
  List<Object?> get props => [];
}

class UserTournamentsStarted extends UserTournamentsEvent {}

class UserTournamentsRefreshed extends UserTournamentsEvent {}
