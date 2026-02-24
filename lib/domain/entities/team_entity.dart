import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final String id;
  final String name;
  final String tag;
  final String? avatarUrl;
  final String? description;
  final String? socialMedia;
  final List<String>? gamesList;
  final DateTime? createdAt;
  final String ownerId;
  final Map<String, int>? count;
  final List<TeamMember> members;
  final List<TeamEntry> entries;
  final bool isBanned;
  final TeamStats stats;

  const TeamEntity({
    required this.id,
    required this.name,
    required this.tag,
    this.avatarUrl,
    this.description,
    this.socialMedia,
    this.gamesList = const [],
    this.createdAt,
    required this.ownerId,
    this.count,
    this.members = const [],
    this.entries = const [],
    this.isBanned = false,
    this.stats = const TeamStats(),
  });

  @override
  List<Object?> get props => [
    id,
    name,
    tag,
    avatarUrl,
    description,
    socialMedia,
    gamesList,
    createdAt,
    ownerId,
    count,
    members,
    entries,
    isBanned,
    stats,
  ];
}

class TeamUserShort extends Equatable {
  final String id;
  final String nickname;
  final String? avatarUrl;
  final bool isBanned;

  const TeamUserShort({
    required this.id,
    required this.nickname,
    this.avatarUrl,
    this.isBanned = false,
  });

  @override
  List<Object?> get props => [id, nickname, avatarUrl, isBanned];
}

class TeamMember extends Equatable {
  final String id;
  final String userId;
  final String teamId;
  final TeamUserShort user;

  const TeamMember({
    required this.id,
    required this.userId,
    required this.teamId,
    required this.user,
  });

  @override
  List<Object?> get props => [id, userId, teamId, user];
}

class TeamEntry extends Equatable {
  final String id;
  final String status;
  final TournamentEntity tournament;

  const TeamEntry({
    required this.id,
    required this.status,
    required this.tournament,
  });

  @override
  List<Object?> get props => [id, status, tournament];
}

class TeamStats extends Equatable {
  final int tournamentsPlayed;
  final int tournamentsWon;
  final double winrate;

  const TeamStats({
    this.tournamentsPlayed = 0,
    this.tournamentsWon = 0,
    this.winrate = 0.0,
  });

  @override
  List<Object?> get props => [tournamentsPlayed, tournamentsWon, winrate];
}
