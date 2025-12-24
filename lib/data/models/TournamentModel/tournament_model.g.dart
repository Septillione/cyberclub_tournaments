// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TournamentModel _$TournamentModelFromJson(Map<String, dynamic> json) =>
    _TournamentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      discipline: $enumDecode(
        _$DisciplineEnumMap,
        json['discipline'],
        unknownValue: Discipline.DOTA2,
      ),
      isOnline: json['isOnline'] as bool,
      address: json['address'] as String?,
      bracketType: $enumDecode(
        _$BracketTypeEnumMap,
        json['bracketType'],
        unknownValue: BracketType.SINGLE_ELIMINATION,
      ),
      teamMode: $enumDecode(
        _$TeamModeEnumMap,
        json['teamMode'],
        unknownValue: TeamMode.team5v5,
      ),
      description: json['description'] as String,
      rules: json['rules'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      status: $enumDecode(
        _$TournamentStatusEnumMap,
        json['status'],
        unknownValue: TournamentStatus.ANNOUNCED,
      ),
      participants: ParticipantsInfo.fromJson(
        json['participants'] as Map<String, dynamic>,
      ),
      prizes:
          (json['prizes'] as List<dynamic>?)
              ?.map((e) => PrizeItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map(
                (e) => TournamentEntryItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TournamentModelToJson(_TournamentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'discipline': _$DisciplineEnumMap[instance.discipline]!,
      'isOnline': instance.isOnline,
      'address': instance.address,
      'bracketType': _$BracketTypeEnumMap[instance.bracketType]!,
      'teamMode': instance.teamMode,
      'description': instance.description,
      'rules': instance.rules,
      'startDate': instance.startDate.toIso8601String(),
      'status': _$TournamentStatusEnumMap[instance.status]!,
      'participants': instance.participants,
      'prizes': instance.prizes,
      'entries': instance.entries,
    };

const _$DisciplineEnumMap = {
  Discipline.DOTA2: 'DOTA2',
  Discipline.CS2: 'CS2',
  Discipline.VALORANT: 'VALORANT',
  Discipline.LEAGUE_OF_LEGENDS: 'LEAGUE_OF_LEGENDS',
  Discipline.FORTNITE: 'FORTNITE',
  Discipline.CALL_OF_DUTY_WARZONE: 'CALL_OF_DUTY_WARZONE',
  Discipline.WORLD_OF_TANKS: 'WORLD_OF_TANKS',
  Discipline.PUBG: 'PUBG',
  Discipline.APEX_LEGENDS: 'APEX_LEGENDS',
  Discipline.WARFACE: 'WARFACE',
  Discipline.FIFA: 'FIFA',
  Discipline.OVERWATCH2: 'OVERWATCH2',
  Discipline.CLASH_ROYALE: 'CLASH_ROYALE',
  Discipline.BRAWL_STARS: 'BRAWL_STARS',
  Discipline.STARCRAFT2: 'STARCRAFT2',
  Discipline.MORTAL_KOMBAT: 'MORTAL_KOMBAT',
  Discipline.TETRIS: 'TETRIS',
};

const _$BracketTypeEnumMap = {
  BracketType.SINGLE_ELIMINATION: 'SINGLE_ELIMINATION',
  BracketType.DOUBLE_ELIMINATION: 'DOUBLE_ELIMINATION',
  BracketType.ROUND_ROBIN: 'ROUND_ROBIN',
  BracketType.SWISS: 'SWISS',
};

const _$TeamModeEnumMap = {
  TeamMode.solo: 'SOLO_1V1',
  TeamMode.duo: 'DUO_2V2',
  TeamMode.team5v5: 'TEAM_5V5',
  TeamMode.squad: 'SQUAD',
};

const _$TournamentStatusEnumMap = {
  TournamentStatus.ANNOUNCED: 'ANNOUNCED',
  TournamentStatus.REGISTRATION_OPEN: 'REGISTRATION_OPEN',
  TournamentStatus.REGISTRATION_CLOSED: 'REGISTRATION_CLOSED',
  TournamentStatus.LIVE: 'LIVE',
  TournamentStatus.FINISHED: 'FINISHED',
  TournamentStatus.CANCELLED: 'CANCELLED',
};

_ParticipantsInfo _$ParticipantsInfoFromJson(Map<String, dynamic> json) =>
    _ParticipantsInfo(
      current: (json['current'] as num).toInt(),
      max: (json['max'] as num).toInt(),
    );

Map<String, dynamic> _$ParticipantsInfoToJson(_ParticipantsInfo instance) =>
    <String, dynamic>{'current': instance.current, 'max': instance.max};

_PrizeItem _$PrizeItemFromJson(Map<String, dynamic> json) => _PrizeItem(
  label: json['label'] as String,
  amount: json['amount'] as String,
);

Map<String, dynamic> _$PrizeItemToJson(_PrizeItem instance) =>
    <String, dynamic>{'label': instance.label, 'amount': instance.amount};

_TournamentEntryItem _$TournamentEntryItemFromJson(Map<String, dynamic> json) =>
    _TournamentEntryItem(
      id: json['id'] as String,
      userId: json['userId'] as String,
      teamId: json['teamId'] as String?,
      user: TeamUserShort.fromJson(json['user'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : TeamShortInfo.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TournamentEntryItemToJson(
  _TournamentEntryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'teamId': instance.teamId,
  'user': instance.user,
  'team': instance.team,
};
