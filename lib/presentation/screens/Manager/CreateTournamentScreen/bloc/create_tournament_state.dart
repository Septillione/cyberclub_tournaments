part of 'create_tournament_bloc.dart';

sealed class CreateTournamentState extends Equatable {
  const CreateTournamentState();

  @override
  List<Object> get props => [];
}

class CreateTournamentInitial extends CreateTournamentState {}

class CreateTournamentLoading extends CreateTournamentState {}

class CreateTournamentSuccess extends CreateTournamentState {}

class CreateTournamentFailure extends CreateTournamentState {
  final String errorMessage;

  const CreateTournamentFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
