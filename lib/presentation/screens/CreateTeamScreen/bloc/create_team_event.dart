part of 'create_team_bloc.dart';

abstract class CreateTeamEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTeamSubmitted extends CreateTeamEvent {
  final String name;
  final String tag;
  final String? description;
  final String? socialMedia;
  final String? avatarUrl;
  final List<String> gamesList;

  CreateTeamSubmitted({
    required this.name,
    required this.tag,
    this.description,
    this.socialMedia,
    this.avatarUrl,
    this.gamesList = const [],
  });

  @override
  List<Object?> get props => [
    name,
    tag,
    description,
    socialMedia,
    avatarUrl,
    gamesList,
  ];
}

class UpdateTeamSubmitted extends CreateTeamEvent {
  final String teamId;
  final String name;
  final String tag;
  final String? description;
  final String? socialMedia;
  final String? avatarUrl;
  final List<String> gamesList;

  UpdateTeamSubmitted({
    required this.teamId,
    required this.name,
    required this.tag,
    this.description,
    this.socialMedia,
    this.avatarUrl,
    this.gamesList = const [],
  });

  @override
  List<Object?> get props => [
    teamId,
    name,
    tag,
    description,
    socialMedia,
    avatarUrl,
    gamesList,
  ];
}
