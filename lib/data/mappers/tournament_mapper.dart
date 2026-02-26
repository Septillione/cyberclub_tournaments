import 'package:cyberclub_tournaments/data/models/tournament/tournament_model.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class TournamentMapper {
  static TournamentEntity toEntity(TournamentModel model) {
    return TournamentEntity(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      discipline: model.discipline.toDisciplineEntity(),
      isOnline: model.isOnline,
      address: model.address,
      bracketType: model.bracketType.toBracketTypeEntity(),
      teamMode: model.teamMode.toTeamModeEntity(),
      description: model.description,
      rules: model.rules,
      startDate: model.startDate,
      status: model.status.toStatusEntity(),
      participants: ParticipantsInfo(
        current: model.participants.current,
        max: model.participants.max,
      ),
      prizes: model.prizes
          .map((p) => PrizeItem(label: p.label, amount: p.amount))
          .toList(),
      entries: model.entries
          .map(
            (e) => TournamentEntryItem(
              id: e.id,
              userId: e.userId,
              teamId: e.teamId,
            ),
          )
          .toList(),
      matches: model.matches
          .map(
            (m) => MatchEntity(
              id: m.id,
              round: m.round,
              position: m.position,
              participant1: m.participant1,
              participant2: m.participant2,
              score1: m.score1,
              score2: m.score2,
            ),
          )
          .toList(),
      creatorId: model.creatorId,
    );
  }

  static TournamentModel toModel(TournamentEntity entity) {
    return TournamentModel(
      id: entity.id,
      title: entity.title,
      imageUrl: entity.imageUrl,
      discipline: disciplineToJson(entity.discipline),
      isOnline: entity.isOnline,
      address: entity.address,
      bracketType: bracketTypeToJson(entity.bracketType),
      teamMode: teamModeToJson(entity.teamMode),
      description: entity.description,
      rules: entity.rules,
      startDate: entity.startDate,
      status: statusToJson(entity.status),
      participants: ParticipantsInfoModel(
        current: entity.participants.current,
        max: entity.participants.max,
      ),
      prizes: entity.prizes
          .map((p) => PrizeItemModel(label: p.label, amount: p.amount))
          .toList(),
      entries: entity.entries
          .map(
            (e) => TournamentEntryItemModel(
              id: e.id,
              userId: e.userId,
              teamId: e.teamId,
            ),
          )
          .toList(),
      matches: entity.matches
          .map(
            (m) => MatchItemModel(
              id: m.id,
              round: m.round,
              position: m.position,
              participant1: m.participant1,
              participant2: m.participant2,
              score1: m.score1,
              score2: m.score2,
            ),
          )
          .toList(),
      creatorId: entity.creatorId,
    );
  }

  static String disciplineToJson(Discipline d) {
    switch (d) {
      case Discipline.dota2:
        return 'DOTA2';
      case Discipline.cs2:
        return 'CS2';
      case Discipline.valorant:
        return 'VALORANT';
      case Discipline.leagueOfLegends:
        return 'LEAGUE_OF_LEGENDS';
      case Discipline.fortnite:
        return 'FORTNITE';
      case Discipline.callOfDutyWarzone:
        return 'CALL_OF_DUTY_WARZONE';
      case Discipline.worldOfTanks:
        return 'WORLD_OF_TANKS';
      case Discipline.pubg:
        return 'PUBG';
      case Discipline.apexLegends:
        return 'APEX_LEGENDS';
      case Discipline.warface:
        return 'WARFACE';
      case Discipline.fifa:
        return 'FIFA';
      case Discipline.overwatch2:
        return 'OVERWATCH2';
      case Discipline.clashRoyale:
        return 'CLASH_ROYALE';
      case Discipline.brawlStars:
        return 'BRAWL_STARS';
      case Discipline.starcraft2:
        return 'STARCRAFT2';
      case Discipline.mortalKombat:
        return 'MORTAL_KOMBAT';
      case Discipline.tetris:
        return 'TETRIS';
    }
  }

  static String teamModeToJson(TeamMode m) {
    switch (m) {
      case TeamMode.solo:
        return 'SOLO_1V1';
      case TeamMode.duo:
        return 'DUO_2V2';
      case TeamMode.team5v5:
        return 'TEAM_5V5';
      case TeamMode.squad:
        return 'SQUAD';
    }
  }

  static String bracketTypeToJson(BracketType b) {
    switch (b) {
      case BracketType.singleElimination:
        return 'SINGLE_ELIMINATION';
      case BracketType.doubleElimination:
        return 'DOUBLE_ELIMINATION';
      case BracketType.roundRobin:
        return 'ROUND_ROBIN';
      case BracketType.swiss:
        return 'SWISS';
    }
  }

  static String statusToJson(TournamentStatus s) {
    switch (s) {
      case TournamentStatus.announced:
        return 'ANNOUNCED';
      case TournamentStatus.registrationOpen:
        return 'REGISTRATION_OPEN';
      case TournamentStatus.registrationClosed:
        return 'REGISTRATION_CLOSED';
      case TournamentStatus.live:
        return 'LIVE';
      case TournamentStatus.finished:
        return 'FINISHED';
      case TournamentStatus.cancelled:
        return 'CANCELLED';
    }
  }
}
