part of 'tournaments_feed_bloc.dart';

sealed class TournamentsFeedState extends Equatable {
  const TournamentsFeedState();

  @override
  List<Object> get props => [];
}

final class TournamentsFeedLoading extends TournamentsFeedState {}

final class TournamentsFeedLoaded extends TournamentsFeedState {
  final List<TournamentModel> allTournaments;
  final List<TournamentModel> filteredTournaments;
  final List<String> disciplines;
  final String selectedDiscipline;

  const TournamentsFeedLoaded({
    required this.allTournaments,
    required this.filteredTournaments,
    required this.disciplines,
    required this.selectedDiscipline,
  });

  @override
  List<Object> get props => [
    filteredTournaments,
    disciplines,
    selectedDiscipline,
  ];
}

final class TournamentsFeedError extends TournamentsFeedState {
  final String errorMessage;

  const TournamentsFeedError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
