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
      discipline: json['discipline'] as String,
      isOnline: json['isOnline'] as bool,
      address: json['address'] as String?,
      bracketType: json['bracketType'] as String,
      teamMode: json['teamMode'] as String,
      description: json['description'] as String,
      rules: json['rules'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      status: json['status'] as String,
      participants: ParticipantsInfoModel.fromJson(
        json['participants'] as Map<String, dynamic>,
      ),
      prizes:
          (json['prizes'] as List<dynamic>?)
              ?.map((e) => PrizeItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map(
                (e) => TournamentEntryItemModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
      matches:
          (json['matches'] as List<dynamic>?)
              ?.map((e) => MatchItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      creatorId: json['creatorId'] as String?,
    );

Map<String, dynamic> _$TournamentModelToJson(_TournamentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'discipline': instance.discipline,
      'isOnline': instance.isOnline,
      'address': instance.address,
      'bracketType': instance.bracketType,
      'teamMode': instance.teamMode,
      'description': instance.description,
      'rules': instance.rules,
      'startDate': instance.startDate.toIso8601String(),
      'status': instance.status,
      'participants': instance.participants,
      'prizes': instance.prizes,
      'entries': instance.entries,
      'matches': instance.matches,
      'creatorId': instance.creatorId,
    };

_ParticipantsInfoModel _$ParticipantsInfoModelFromJson(
  Map<String, dynamic> json,
) => _ParticipantsInfoModel(
  current: (json['current'] as num).toInt(),
  max: (json['max'] as num).toInt(),
);

Map<String, dynamic> _$ParticipantsInfoModelToJson(
  _ParticipantsInfoModel instance,
) => <String, dynamic>{'current': instance.current, 'max': instance.max};

_PrizeItemModel _$PrizeItemModelFromJson(Map<String, dynamic> json) =>
    _PrizeItemModel(
      label: json['label'] as String,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$PrizeItemModelToJson(_PrizeItemModel instance) =>
    <String, dynamic>{'label': instance.label, 'amount': instance.amount};

_TournamentEntryItemModel _$TournamentEntryItemModelFromJson(
  Map<String, dynamic> json,
) => _TournamentEntryItemModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  teamId: json['teamId'] as String?,
);

Map<String, dynamic> _$TournamentEntryItemModelToJson(
  _TournamentEntryItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'teamId': instance.teamId,
};

_MatchItemModel _$MatchItemModelFromJson(Map<String, dynamic> json) =>
    _MatchItemModel(
      id: json['id'] as String,
      round: (json['round'] as num).toInt(),
      position: (json['position'] as num).toInt(),
      participant1: json['participant1'] as String?,
      participant2: json['participant2'] as String?,
      score1: (json['score1'] as num?)?.toInt() ?? 0,
      score2: (json['score2'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MatchItemModelToJson(_MatchItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'round': instance.round,
      'position': instance.position,
      'participant1': instance.participant1,
      'participant2': instance.participant2,
      'score1': instance.score1,
      'score2': instance.score2,
    };
