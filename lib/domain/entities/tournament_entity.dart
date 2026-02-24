import 'package:equatable/equatable.dart';

enum Discipline {
  dota2,
  cs2,
  valorant,
  leagueOfLegends,
  fortnite,
  callOfDutyWarzone,
  worldOfTanks,
  pubg,
  apexLegends,
  warface,
  fifa,
  overwatch2,
  clashRoyale,
  brawlStars,
  starcraft2,
  mortalKombat,
  tetris;

  String get title {
    switch (this) {
      case Discipline.dota2:
        return 'Dota 2';
      case Discipline.cs2:
        return 'CS 2';
      case Discipline.valorant:
        return 'Valorant';
      case Discipline.leagueOfLegends:
        return 'League of Legends';
      case Discipline.fortnite:
        return 'Fortnite';
      case Discipline.callOfDutyWarzone:
        return 'Call of Duty: Warzone';
      case Discipline.worldOfTanks:
        return 'Мир танков';
      case Discipline.pubg:
        return 'PUBG';
      case Discipline.apexLegends:
        return 'Apex Legends';
      case Discipline.warface:
        return 'Warface';
      case Discipline.fifa:
        return 'FIFA';
      case Discipline.overwatch2:
        return 'Overwatch 2';
      case Discipline.clashRoyale:
        return 'Clash Royale';
      case Discipline.brawlStars:
        return 'Brawl Stars';
      case Discipline.starcraft2:
        return 'StarCraft II';
      case Discipline.mortalKombat:
        return 'Mortal Kombat';
      case Discipline.tetris:
        return 'Tetris';
    }
  }
}

enum TournamentStatus {
  announced,
  registrationOpen,
  registrationClosed,
  live,
  finished,
  cancelled;

  String get title {
    switch (this) {
      case TournamentStatus.announced:
        return 'Анонсирован';
      case TournamentStatus.registrationOpen:
        return 'Регистрация открыта';
      case TournamentStatus.registrationClosed:
        return 'Регистрация закрыта';
      case TournamentStatus.live:
        return 'LIVE';
      case TournamentStatus.finished:
        return 'Завершен';
      case TournamentStatus.cancelled:
        return 'Отменен';
    }
  }
}

enum BracketType {
  singleElimination,
  doubleElimination,
  roundRobin,
  swiss;

  String get title {
    switch (this) {
      case BracketType.singleElimination:
        return 'Single elimination';
      case BracketType.doubleElimination:
        return 'Double elimination';
      case BracketType.roundRobin:
        return 'Round robin';
      case BracketType.swiss:
        return 'Swiss';
    }
  }
}

enum TeamMode {
  solo,
  duo,
  team5v5,
  squad;

  String get title {
    switch (this) {
      case TeamMode.solo:
        return 'Solo 1v1';
      case TeamMode.duo:
        return 'Duo 2v2';
      case TeamMode.team5v5:
        return 'Team 5v5';
      case TeamMode.squad:
        return 'Squad';
    }
  }
}

class TournamentEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final Discipline discipline;
  final bool isOnline;
  final String? address;
  final BracketType bracketType;
  final TeamMode teamMode;
  final String description;
  final String rules;
  final DateTime startDate;
  final TournamentStatus status;
  final ParticipantsInfo participants;
  final List<PrizeItem> prizes;
  final List<TournamentEntryItem> entries;
  final List<MatchEntity> matches;
  final String? creatorId;

  const TournamentEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.discipline,
    required this.isOnline,
    this.address,
    required this.bracketType,
    required this.teamMode,
    required this.description,
    required this.rules,
    required this.startDate,
    required this.status,
    required this.participants,
    this.prizes = const [],
    this.entries = const [],
    this.matches = const [],
    this.creatorId,
  });

  bool get isRegistrationOpen => status == TournamentStatus.registrationOpen;

  bool get hasAvailableSlots => participants.current < participants.max;

  bool get canRegister => isRegistrationOpen && hasAvailableSlots;

  @override
  List<Object?> get props => [
    id,
    title,
    imageUrl,
    discipline,
    isOnline,
    address,
    bracketType,
    teamMode,
    description,
    rules,
    startDate,
    status,
    participants,
    prizes,
    entries,
    matches,
    creatorId,
  ];
}

class ParticipantsInfo extends Equatable {
  final int current;
  final int max;

  const ParticipantsInfo({required this.current, required this.max});

  @override
  List<Object?> get props => [current, max];
}

class PrizeItem extends Equatable {
  final String label;
  final String amount;

  const PrizeItem({required this.label, required this.amount});

  @override
  List<Object?> get props => [label, amount];
}

class MatchEntity extends Equatable {
  final String id;
  final int round;
  final int position;
  final String? participant1;
  final String? participant2;
  final int score1;
  final int score2;

  const MatchEntity({
    required this.id,
    required this.round,
    required this.position,
    this.participant1,
    this.participant2,
    this.score1 = 0,
    this.score2 = 0,
  });

  @override
  List<Object?> get props => [
    id,
    round,
    position,
    participant1,
    participant2,
    score1,
    score2,
  ];
}

class TournamentEntryItem extends Equatable {
  final String id;
  final String userId;
  final String? teamId;

  const TournamentEntryItem({
    required this.id,
    required this.userId,
    this.teamId,
  });

  @override
  List<Object?> get props => [id, userId, teamId];
}
