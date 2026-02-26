import 'package:cyberclub_tournaments/data/mappers/tournament_mapper.dart';
import 'package:cyberclub_tournaments/data/models/user/user_model.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      nickname: model.nickname,
      email: model.email,
      role: roleToEntity(model.role),
      avatarUrl: model.avatarUrl,
      bio: model.bio,
      entries: model.entries.map(entryToEntity).toList(),
      isBanned: model.isBanned,
      stats: statsToEntity(model.stats),
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      nickname: entity.nickname,
      email: entity.email,
      role: roleToJson(entity.role),
      avatarUrl: entity.avatarUrl,
      bio: entity.bio,
      entries: entity.entries.map(entryToModel).toList(),
      isBanned: entity.isBanned,
      stats: statsToModel(entity.stats),
    );
  }

  static UserRole roleToEntity(String role) {
    switch (role) {
      case 'MANAGER':
        return UserRole.manager;
      case 'ADMIN':
        return UserRole.admin;
      case 'USER':
        return UserRole.user;
      default:
        return UserRole.user;
    }
  }

  static String roleToJson(UserRole role) {
    switch (role) {
      case UserRole.manager:
        return 'MANAGER';
      case UserRole.admin:
        return 'ADMIN';
      case UserRole.user:
        return 'USER';
    }
  }

  static UserEntry entryToEntity(UserEntryModel model) {
    return UserEntry(
      id: model.id,
      status: model.status,
      tournament: TournamentMapper.toEntity(model.tournament),
    );
  }

  static UserEntryModel entryToModel(UserEntry entry) {
    return UserEntryModel(
      id: entry.id,
      status: entry.status,
      tournament: TournamentMapper.toModel(entry.tournament),
    );
  }

  static UserStats statsToEntity(UserStatsModel model) {
    return UserStats(
      tournamentsPlayed: model.tournamentsPlayed,
      tournamentsWon: model.tournamentsWon,
      winrate: model.winrate,
    );
  }

  static UserStatsModel statsToModel(UserStats stats) {
    return UserStatsModel(
      tournamentsPlayed: stats.tournamentsPlayed,
      tournamentsWon: stats.tournamentsWon,
      winrate: stats.winrate,
    );
  }
}
