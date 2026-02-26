part of 'user_tournaments_bloc.dart';

abstract class UserTournamentsState extends Equatable {
  const UserTournamentsState();

  @override
  List<Object?> get props => [];
}

class UserTournamentsLoading extends UserTournamentsState {}

class UserTournamentsLoaded extends UserTournamentsState {
  final List<TournamentEntity> activeTournaments;
  final List<TournamentEntity> upcomingTournaments;
  final List<TournamentEntity> finishedTournaments;
  final String currentUserId;

  const UserTournamentsLoaded({
    required this.activeTournaments,
    required this.upcomingTournaments,
    required this.finishedTournaments,
    required this.currentUserId,
  });

  @override
  List<Object?> get props => [
    activeTournaments,
    upcomingTournaments,
    finishedTournaments,
    currentUserId,
  ];
}

class UserTournamentsError extends UserTournamentsState {
  final String errorMessage;

  const UserTournamentsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
