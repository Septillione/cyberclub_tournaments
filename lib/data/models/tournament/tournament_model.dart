import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart'
    as entity;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

extension DisciplineMapper on String {
  entity.Discipline toDisciplineEntity() {
    switch (this) {
      case 'DOTA2':
        return entity.Discipline.dota2;
      case 'CS2':
        return entity.Discipline.cs2;
      case 'VALORANT':
        return entity.Discipline.valorant;
      case 'LEAGUE_OF_LEGENDS':
        return entity.Discipline.leagueOfLegends;
      case 'FORTNITE':
        return entity.Discipline.fortnite;
      case 'CALL_OF_DUTY_WARZONE':
        return entity.Discipline.callOfDutyWarzone;
      case 'WORLD_OF_TANKS':
        return entity.Discipline.worldOfTanks;
      case 'PUBG':
        return entity.Discipline.pubg;
      case 'APEX_LEGENDS':
        return entity.Discipline.apexLegends;
      case 'WARFACE':
        return entity.Discipline.warface;
      case 'FIFA':
        return entity.Discipline.fifa;
      case 'OVERWATCH2':
        return entity.Discipline.overwatch2;
      case 'CLASH_ROYALE':
        return entity.Discipline.clashRoyale;
      case 'BRAWL_STARS':
        return entity.Discipline.brawlStars;
      case 'STARCRAFT2':
        return entity.Discipline.starcraft2;
      case 'MORTAL_KOMBAT':
        return entity.Discipline.mortalKombat;
      case 'TETRIS':
        return entity.Discipline.tetris;
      default:
        return entity.Discipline.dota2;
    }
  }
}

extension TeamModeMapper on String {
  entity.TeamMode toTeamModeEntity() {
    switch (this) {
      case 'SOLO_1V1':
        return entity.TeamMode.solo;
      case 'DUO_2V2':
        return entity.TeamMode.duo;
      case 'TEAM_5V5':
        return entity.TeamMode.team5v5;
      case 'SQUAD':
        return entity.TeamMode.squad;
      default:
        return entity.TeamMode.team5v5;
    }
  }
}

extension BracketTypeMapper on String {
  entity.BracketType toBracketTypeEntity() {
    switch (this) {
      case 'SINGLE_ELIMINATION':
        return entity.BracketType.singleElimination;
      case 'DOUBLE_ELIMINATION':
        return entity.BracketType.doubleElimination;
      case 'ROUND_ROBIN':
        return entity.BracketType.roundRobin;
      case 'SWISS':
        return entity.BracketType.swiss;
      default:
        return entity.BracketType.singleElimination;
    }
  }
}

extension TournamentStatusMapper on String {
  entity.TournamentStatus toStatusEntity() {
    switch (this) {
      case 'ANNOUNCED':
        return entity.TournamentStatus.announced;
      case 'REGISTRATION_OPEN':
        return entity.TournamentStatus.registrationOpen;
      case 'REGISTRATION_CLOSED':
        return entity.TournamentStatus.registrationClosed;
      case 'LIVE':
        return entity.TournamentStatus.live;
      case 'FINISHED':
        return entity.TournamentStatus.finished;
      case 'CANCELLED':
        return entity.TournamentStatus.cancelled;
      default:
        return entity.TournamentStatus.announced;
    }
  }
}

@freezed
abstract class TournamentModel with _$TournamentModel {
  const factory TournamentModel({
    required String id,
    required String title,
    required String imageUrl,
    required String discipline,
    required bool isOnline,
    String? address,
    required String bracketType,
    required String teamMode,
    required String description,
    required String rules,
    required DateTime startDate,
    required String status,
    required ParticipantsInfoModel participants,
    @Default([]) List<PrizeItemModel> prizes,
    @Default([]) List<TournamentEntryItemModel> entries,
    @Default([]) List<MatchItemModel> matches,
    String? creatorId,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);
}

@freezed
abstract class ParticipantsInfoModel with _$ParticipantsInfoModel {
  const factory ParticipantsInfoModel({
    required int current,
    required int max,
  }) = _ParticipantsInfoModel;

  factory ParticipantsInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsInfoModelFromJson(json);
}

@freezed
abstract class PrizeItemModel with _$PrizeItemModel {
  const factory PrizeItemModel({
    required String label,
    required String amount,
  }) = _PrizeItemModel;

  factory PrizeItemModel.fromJson(Map<String, dynamic> json) =>
      _$PrizeItemModelFromJson(json);
}

@freezed
abstract class TournamentEntryItemModel with _$TournamentEntryItemModel {
  const factory TournamentEntryItemModel({
    required String id,
    required String userId,
    String? teamId,
  }) = _TournamentEntryItemModel;

  factory TournamentEntryItemModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentEntryItemModelFromJson(json);
}

@freezed
abstract class MatchItemModel with _$MatchItemModel {
  const factory MatchItemModel({
    required String id,
    required int round,
    required int position,
    String? participant1,
    String? participant2,
    @Default(0) int score1,
    @Default(0) int score2,
  }) = _MatchItemModel;

  factory MatchItemModel.fromJson(Map<String, dynamic> json) =>
      _$MatchItemModelFromJson(json);
}
