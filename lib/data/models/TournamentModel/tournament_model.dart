import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

enum Discipline {
  DOTA2,
  CS2,
  VALORANT,
  LEAGUE_OF_LEGENDS,
  FORTNITE,
  CALL_OF_DUTY_WARZONE,
  WORLD_OF_TANKS,
  PUBG,
  APEX_LEGENDS,
  WARFACE,
  FIFA,
  OVERWATCH2,
  CLASH_ROYALE,
  BRAWL_STARS,
  STARCRAFT2,
  MORTAL_KOMBAT,
  TETRIS;

  String get title {
    switch (this) {
      case Discipline.DOTA2:
        return 'Dota 2';
      case Discipline.CS2:
        return 'CS 2';
      case Discipline.VALORANT:
        return 'Valorant';
      case Discipline.LEAGUE_OF_LEGENDS:
        return 'League of Legends';
      case Discipline.FORTNITE:
        return 'Fortnite';
      case Discipline.CALL_OF_DUTY_WARZONE:
        return 'Call of Duty: Warzone';
      case Discipline.WORLD_OF_TANKS:
        return 'Мир танков';
      case Discipline.PUBG:
        return 'PUBG';
      case Discipline.APEX_LEGENDS:
        return 'Apex Legends';
      case Discipline.WARFACE:
        return 'Warface';
      case Discipline.FIFA:
        return 'FIFA';
      case Discipline.OVERWATCH2:
        return 'Overwatch 2';
      case Discipline.CLASH_ROYALE:
        return 'Clash Royale';
      case Discipline.BRAWL_STARS:
        return 'Brawl Stars';
      case Discipline.STARCRAFT2:
        return 'StarCraft II';
      case Discipline.MORTAL_KOMBAT:
        return 'Mortal Kombat';
      case Discipline.TETRIS:
        return 'Tetris';
    }
  }
}

enum TournamentStatus {
  ANNOUNCED,
  REGISTRATION_OPEN,
  REGISTRATION_CLOSED,
  LIVE,
  FINISHED,
  CANCELLED,
}

enum BracketType { SINGLE_ELIMINATION, DOUBLE_ELIMINATION, ROUND_ROBIN, SWISS }

enum TeamMode {
  @JsonValue('SOLO_1V1')
  solo,
  @JsonValue('DUO_2V2')
  duo,
  @JsonValue('TEAM_5V5')
  team5v5,
  @JsonValue('SQUAD')
  squad;

  String toJson() {
    switch (this) {
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
}

@freezed
abstract class TournamentModel with _$TournamentModel {
  const factory TournamentModel({
    required String id,
    required String title,
    required String imageUrl,

    @JsonKey(unknownEnumValue: Discipline.DOTA2) required Discipline discipline,

    required bool isOnline,
    String? address,

    @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)
    required BracketType bracketType,

    @JsonKey(unknownEnumValue: TeamMode.team5v5) required TeamMode teamMode,

    required String description,
    required String rules,
    required DateTime startDate,

    @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)
    required TournamentStatus status,

    required ParticipantsInfo participants,

    @Default([]) List<PrizeItem> prizes,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);
}

@freezed
abstract class ParticipantsInfo with _$ParticipantsInfo {
  const factory ParticipantsInfo({required int current, required int max}) =
      _ParticipantsInfo;

  factory ParticipantsInfo.fromJson(Map<String, dynamic> json) =>
      _$ParticipantsInfoFromJson(json);
}

@freezed
abstract class PrizeItem with _$PrizeItem {
  const factory PrizeItem({required String label, required String amount}) =
      _PrizeItem;

  factory PrizeItem.fromJson(Map<String, dynamic> json) =>
      _$PrizeItemFromJson(json);
}
