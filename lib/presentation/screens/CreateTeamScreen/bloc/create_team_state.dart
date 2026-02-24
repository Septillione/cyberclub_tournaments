part of 'create_team_bloc.dart';

abstract class CreateTeamState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTeamInitial extends CreateTeamState {}

class CreateTeamLoading extends CreateTeamState {}

class CreateTeamSuccess extends CreateTeamState {
  final bool isEditing;

  CreateTeamSuccess({this.isEditing = false});

  @override
  List<Object?> get props => [isEditing];
}

class CreateTeamFailure extends CreateTeamState {
  final String errorMessage;

  CreateTeamFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
