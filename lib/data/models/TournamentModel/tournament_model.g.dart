// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TournamentParticipants _$TournamentParticipantsFromJson(
  Map<String, dynamic> json,
) => _TournamentParticipants(
  currentParticipants: (json['currentParticipants'] as num).toInt(),
  maxParticipants: (json['maxParticipants'] as num).toInt(),
);

Map<String, dynamic> _$TournamentParticipantsToJson(
  _TournamentParticipants instance,
) => <String, dynamic>{
  'currentParticipants': instance.currentParticipants,
  'maxParticipants': instance.maxParticipants,
};

_TournamentPrizes _$TournamentPrizesFromJson(Map<String, dynamic> json) =>
    _TournamentPrizes(
      firstPlace: json['firstPlace'] as String?,
      secondPlace: json['secondPlace'] as String?,
      thirdPlace: json['thirdPlace'] as String?,
    );

Map<String, dynamic> _$TournamentPrizesToJson(_TournamentPrizes instance) =>
    <String, dynamic>{
      'firstPlace': instance.firstPlace,
      'secondPlace': instance.secondPlace,
      'thirdPlace': instance.thirdPlace,
    };

_TournamentModel _$TournamentModelFromJson(Map<String, dynamic> json) =>
    _TournamentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      discipline: json['discipline'] as String,
      prizePool: (json['prizePool'] as num).toInt(),
      type: json['type'] as String,
      address: json['address'] as String?,
      format: json['format'] as String,
      formatVersus: json['formatVersus'] as String,
      description: json['description'] as String,
      rules: json['rules'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      status: $enumDecode(_$TournamentStatusEnumMap, json['status']),
      registeredPlayerIds:
          (json['registeredPlayerIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      participants: TournamentParticipants.fromJson(
        json['participants'] as Map<String, dynamic>,
      ),
      prizes: TournamentPrizes.fromJson(json['prizes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TournamentModelToJson(_TournamentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'discipline': instance.discipline,
      'prizePool': instance.prizePool,
      'type': instance.type,
      'address': instance.address,
      'format': instance.format,
      'formatVersus': instance.formatVersus,
      'description': instance.description,
      'rules': instance.rules,
      'startDate': instance.startDate.toIso8601String(),
      'status': _$TournamentStatusEnumMap[instance.status]!,
      'registeredPlayerIds': instance.registeredPlayerIds,
      'participants': instance.participants,
      'prizes': instance.prizes,
    };

const _$TournamentStatusEnumMap = {
  TournamentStatus.announced: 'announced',
  TournamentStatus.registrationOpened: 'registrationOpened',
  TournamentStatus.registrationClosed: 'registrationClosed',
  TournamentStatus.live: 'live',
  TournamentStatus.finished: 'finished',
  TournamentStatus.cancelled: 'cancelled',
};
