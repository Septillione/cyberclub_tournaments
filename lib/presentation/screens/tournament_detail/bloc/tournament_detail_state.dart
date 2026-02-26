part of 'tournament_detail_bloc.dart';

abstract class TournamentDetailState extends Equatable {
  const TournamentDetailState();

  @override
  List<Object?> get props => [];
}

class TournamentDetailLoading extends TournamentDetailState {}

class TournamentDetailLoaded extends TournamentDetailState {
  final TournamentEntity tournament;
  final List<Tournament> bracketRounds;
  final String currentUserId;

  const TournamentDetailLoaded({
    required this.tournament,
    required this.bracketRounds,
    required this.currentUserId,
  });

  @override
  List<Object?> get props => [tournament, bracketRounds, currentUserId];
}

class TournamentDetailError extends TournamentDetailState {
  final String errorMessage;

  const TournamentDetailError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
