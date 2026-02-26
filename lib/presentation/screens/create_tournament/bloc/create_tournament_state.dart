part of 'create_tournament_bloc.dart';

abstract class CreateTournamentState extends Equatable {
  const CreateTournamentState();

  @override
  List<Object?> get props => [];
}

class CreateTournamentInitial extends CreateTournamentState {}

class CreateTournamentLoading extends CreateTournamentState {}

class CreateTournamentSuccess extends CreateTournamentState {
  final bool isEditing;

  const CreateTournamentSuccess({this.isEditing = false});

  @override
  List<Object?> get props => [isEditing];
}

class CreateTournamentFailure extends CreateTournamentState {
  final String errorMessage;

  const CreateTournamentFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
