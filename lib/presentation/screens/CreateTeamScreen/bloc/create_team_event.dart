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
  final String? avatarUrl;

  const CreateTeamSubmitted({
    required this.name,
    required this.tag,
    this.avatarUrl,
  });

  @override
  List<Object> get props => [name, tag, ?avatarUrl];
}
