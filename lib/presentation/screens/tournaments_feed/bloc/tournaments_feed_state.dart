part of 'tournaments_feed_bloc.dart';

abstract class TournamentsFeedState extends Equatable {
  const TournamentsFeedState();

  @override
  List<Object?> get props => [];
}

class TournamentsFeedLoading extends TournamentsFeedState {}

class TournamentsFeedLoaded extends TournamentsFeedState {
  final List<TournamentEntity> tournaments;
  final TournamentFilter currentFilter;

  const TournamentsFeedLoaded({
    required this.tournaments,
    this.currentFilter = const TournamentFilter(),
  });

  @override
  List<Object?> get props => [tournaments, currentFilter];
}

class TournamentsFeedError extends TournamentsFeedState {
  final String errorMessage;

  const TournamentsFeedError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
