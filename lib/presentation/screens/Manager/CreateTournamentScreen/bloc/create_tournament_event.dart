part of 'create_tournament_bloc.dart';

@immutable
abstract class CreateTournamentEvent extends Equatable {
  const CreateTournamentEvent();

  @override
  List<Object> get props => [];
}

class CreateTournamentSubmitted extends CreateTournamentEvent {
  final String title;
  final String description;
  final String rules;
  final Discipline discipline;
  final DateTime startDate;
  final int maxParticipants;
  final BracketType bracketType;
  final TeamMode teamMode;
  final bool isOnline;
  final String? address;
  final String? imageUrl;
  final List<PrizeItem>? prizes;

  const CreateTournamentSubmitted({
    required this.title,
    required this.description,
    required this.rules,
    required this.discipline,
    required this.startDate,
    required this.maxParticipants,
    required this.bracketType,
    required this.teamMode,
    required this.isOnline,
    this.address,
    this.imageUrl,
    this.prizes,
  });

  @override
  List<Object> get props => [
    title,
    description,
    rules,
    discipline,
    startDate,
    maxParticipants,
    bracketType,
    teamMode,
    isOnline,
    ?address,
    ?imageUrl,
    ?prizes,
  ];
}

class UpdateTournamentSubmitted extends CreateTournamentEvent {
  final String id;
  final String title;
  final String description;
  final String rules;
  final Discipline discipline;
  final DateTime startDate;
  final int maxParticipants;
  final BracketType bracketType;
  final TeamMode teamMode;
  final bool isOnline;
  final String? address;
  final String? imageUrl;
  final List<PrizeItem>? prizes;

  const UpdateTournamentSubmitted({
    required this.id,
    required this.title,
    required this.description,
    required this.rules,
    required this.discipline,
    required this.startDate,
    required this.maxParticipants,
    required this.bracketType,
    required this.teamMode,
    required this.isOnline,
    this.address,
    this.imageUrl,
    this.prizes,
  });
}

class CancelTournamentSubmitted extends CreateTournamentEvent {
  final String touranmentId;

  const CancelTournamentSubmitted({required this.touranmentId});

  @override
  List<Object> get props => [touranmentId];
}
