part of 'create_team_bloc.dart';

@immutable
abstract class CreateTeamEvent extends Equatable {
  const CreateTeamEvent();

  @override
  List<Object> get props => [];
}

class CreateTeamSubmitted extends CreateTeamEvent {
  final String name;
  final String tag;
  final String? description;
  final String? socialMedia;
  final List<String>? gamesList;
  final String? avatarUrl;

  const CreateTeamSubmitted({
    required this.name,
    required this.tag,
    this.description,
    this.socialMedia,
    this.gamesList,
    this.avatarUrl,
  });

  @override
  List<Object> get props => [
    name,
    tag,
    ?description,
    ?socialMedia,
    ?gamesList,
    ?avatarUrl,
  ];
}
