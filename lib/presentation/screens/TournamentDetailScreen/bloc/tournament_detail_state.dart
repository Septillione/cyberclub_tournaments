part of 'tournament_detail_bloc.dart';

sealed class TournamentDetailState extends Equatable {
  const TournamentDetailState();

  @override
  List<Object> get props => [];
}

final class TournamentDetailLoading extends TournamentDetailState {}

final class TournamentDetailLoaded extends TournamentDetailState {
  final TournamentModel tournament;

  const TournamentDetailLoaded({required this.tournament});

  @override
  List<Object> get props => [tournament];
}

final class TournamentDetailError extends TournamentDetailState {
  final String errorMessage;

  const TournamentDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
