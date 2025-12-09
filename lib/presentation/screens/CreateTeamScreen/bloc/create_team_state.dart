part of 'create_team_bloc.dart';

sealed class CreateTeamState extends Equatable {
  const CreateTeamState();

  @override
  List<Object> get props => [];
}

class CreateTeamInitial extends CreateTeamState {}

class CreateTeamLoading extends CreateTeamState {}

class CreateTeamSuccess extends CreateTeamState {}

class CreateTeamFailure extends CreateTeamState {
  final String errorMessage;

  const CreateTeamFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
