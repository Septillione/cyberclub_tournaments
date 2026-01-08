part of 'user_tournaments_bloc.dart';

sealed class UserTournamentsState extends Equatable {
  const UserTournamentsState();

  @override
  List<Object> get props => [];
}

final class UserTournamentsLoading extends UserTournamentsState {}

final class UserTournamentsLoaded extends UserTournamentsState {
  final List<TournamentModel> activeTournaments;
  final List<TournamentModel> upcomingTournaments;
  final List<TournamentModel> finishedTournaments;
  final String currentUserId;

  const UserTournamentsLoaded({
    required this.activeTournaments,
    required this.upcomingTournaments,
    required this.finishedTournaments,
    required this.currentUserId,
  });

  @override
  List<Object> get props => [
    activeTournaments,
    upcomingTournaments,
    finishedTournaments,
    currentUserId,
  ];
}

final class UserTournamentsError extends UserTournamentsState {
  final String errorMessage;

  const UserTournamentsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
