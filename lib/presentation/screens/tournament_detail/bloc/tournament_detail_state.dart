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

class TeamSelectionLoading extends TournamentDetailLoaded {
  const TeamSelectionLoading({
    required super.tournament,
    required super.currentUserId,
    required super.bracketRounds,
  });
}

class TeamSelectionLoaded extends TournamentDetailLoaded {
  final List<TeamEntity> userTeams;

  const TeamSelectionLoaded({
    required this.userTeams,
    required super.bracketRounds,
    required super.currentUserId,
    required super.tournament,
  });

  @override
  List<Object?> get props => [super.props, userTeams];
}

class TeamSelectionError extends TournamentDetailLoaded {
  final String error;

  const TeamSelectionError({
    required this.error,
    required super.tournament,
    required super.currentUserId,
    required super.bracketRounds,
  });

  @override
  List<Object?> get props => [super.props, error];
}
