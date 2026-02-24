import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:equatable/equatable.dart';

enum UserRole {
  user,
  manager,
  admin;

  String get title {
    switch (this) {
      case UserRole.user:
        return 'Пользователь';
      case UserRole.manager:
        return 'Менеджер';
      case UserRole.admin:
        return 'Администратор';
    }
  }
}

class UserStats extends Equatable {
  final int tournamentsPlayed;
  final int tournamentsWon;
  final double winrate;

  const UserStats({
    this.tournamentsPlayed = 0,
    this.tournamentsWon = 0,
    this.winrate = 0.0,
  });

  @override
  List<Object?> get props => [tournamentsPlayed, tournamentsWon, winrate];
}

class UserEntry extends Equatable {
  final String id;
  final String status;
  final TournamentEntity tournament;

  const UserEntry({
    required this.id,
    required this.status,
    required this.tournament,
  });

  @override
  List<Object?> get props => [id, status, tournament];
}

class UserEntity extends Equatable {
  final String id;
  final String nickname;
  final String email;
  final UserRole role;
  final String? avatarUrl;
  final String? bio;
  final List<UserEntry> entries;
  final bool isBanned;
  final UserStats stats;

  const UserEntity({
    required this.id,
    required this.nickname,
    required this.email,
    required this.role,
    this.avatarUrl,
    this.bio,
    this.entries = const [],
    this.isBanned = false,
    this.stats = const UserStats(),
  });

  bool get isAdmin => role == UserRole.admin;
  bool get isManager => role == UserRole.manager;
  bool get hasAvatar => avatarUrl != null && avatarUrl!.isNotEmpty;
  bool get canParticipate => !isBanned;

  @override
  List<Object?> get props => [
    id,
    nickname,
    email,
    role,
    avatarUrl,
    bio,
    entries,
    isBanned,
    stats,
  ];
}
