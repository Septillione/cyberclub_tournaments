part of 'tournaments_feed_bloc.dart';

sealed class TournamentsFeedState extends Equatable {
  const TournamentsFeedState();

  @override
  List<Object> get props => [];
}

final class TournamentsFeedLoading extends TournamentsFeedState {}

final class TournamentsFeedLoaded extends TournamentsFeedState {
  final List<TournamentModel> tournaments;
  final TournamentFilter currentFilter;

  const TournamentsFeedLoaded({
    required this.tournaments,
    required this.currentFilter,
  });

  @override
  List<Object> get props => [tournaments, currentFilter];
}

final class TournamentsFeedError extends TournamentsFeedState {
  final String errorMessage;

  const TournamentsFeedError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
