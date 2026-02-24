import 'package:cyberclub_tournaments/datanew/mappers/tournament_mapper.dart';
import 'package:cyberclub_tournaments/datanew/models/team/team_model.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';

class TeamMapper {
  static TeamEntity toEntity(TeamModel model) {
    return TeamEntity(
      id: model.id,
      name: model.name,
      tag: model.tag,
      avatarUrl: model.avatarUrl,
      description: model.description,
      socialMedia: model.socialMedia,
      gamesList: model.gamesList,
      createdAt: model.createdAt,
      ownerId: model.ownerId,
      count: model.count,
      members: model.members.map(memberToEntity).toList(),
      entries: model.entries.map(entryToEntity).toList(),
      isBanned: model.isBanned,
      stats: statsToEntity(model.stats),
    );
  }

  static TeamModel toModel(TeamEntity entity) {
    return TeamModel(
      id: entity.id,
      name: entity.name,
      tag: entity.tag,
      avatarUrl: entity.avatarUrl,
      description: entity.description,
      socialMedia: entity.socialMedia,
      gamesList: entity.gamesList,
      createdAt: entity.createdAt,
      ownerId: entity.ownerId,
      count: entity.count,
      members: entity.members.map(memberToModel).toList(),
      entries: entity.entries.map(entryToModel).toList(),
      isBanned: entity.isBanned,
      stats: statsToModel(entity.stats),
    );
  }

  static TeamMember memberToEntity(TeamMemberModel model) {
    return TeamMember(
      id: model.id,
      userId: model.userId,
      teamId: model.teamId,
      user: userShortToEntity(model.user),
    );
  }

  static TeamMemberModel memberToModel(TeamMember entity) {
    return TeamMemberModel(
      id: entity.id,
      userId: entity.userId,
      teamId: entity.teamId,
      user: userShortToModel(entity.user),
    );
  }

  static TeamUserShort userShortToEntity(TeamUserShortModel model) {
    return TeamUserShort(
      id: model.id,
      nickname: model.nickname,
      avatarUrl: model.avatarUrl,
      isBanned: model.isBanned,
    );
  }

  static TeamUserShortModel userShortToModel(TeamUserShort entity) {
    return TeamUserShortModel(
      id: entity.id,
      nickname: entity.nickname,
      avatarUrl: entity.avatarUrl,
      isBanned: entity.isBanned,
    );
  }

  static TeamEntry entryToEntity(TeamEntryModel model) {
    return TeamEntry(
      id: model.id,
      status: model.status,
      tournament: TournamentMapper.toEntity(model.tournament),
    );
  }

  static TeamEntryModel entryToModel(TeamEntry entity) {
    return TeamEntryModel(
      id: entity.id,
      status: entity.status,
      tournament: TournamentMapper.toModel(entity.tournament),
    );
  }

  static TeamStats statsToEntity(TeamStatsModel model) {
    return TeamStats(
      tournamentsPlayed: model.tournamentsPlayed,
      tournamentsWon: model.tournamentsWon,
      winrate: model.winrate,
    );
  }

  static TeamStatsModel statsToModel(TeamStats entity) {
    return TeamStatsModel(
      tournamentsPlayed: entity.tournamentsPlayed,
      tournamentsWon: entity.tournamentsWon,
      winrate: entity.winrate,
    );
  }
}
