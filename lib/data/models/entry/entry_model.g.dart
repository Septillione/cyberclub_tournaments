// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EntryModel _$EntryModelFromJson(Map<String, dynamic> json) => _EntryModel(
  id: json['id'] as String,
  tournamentId: json['tournamentId'] as String,
  teamId: json['teamId'] as String,
  playerIds:
      (json['playerIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  status: json['status'] as String,
);

Map<String, dynamic> _$EntryModelToJson(_EntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentId': instance.tournamentId,
      'teamId': instance.teamId,
      'playerIds': instance.playerIds,
      'status': instance.status,
    };
