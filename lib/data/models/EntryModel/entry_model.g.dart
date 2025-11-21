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
  status: $enumDecode(_$EntryStatusEnumMap, json['status']),
);

Map<String, dynamic> _$EntryModelToJson(_EntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentId': instance.tournamentId,
      'teamId': instance.teamId,
      'playerIds': instance.playerIds,
      'status': _$EntryStatusEnumMap[instance.status]!,
    };

const _$EntryStatusEnumMap = {
  EntryStatus.pending: 'pending',
  EntryStatus.accepted: 'accepted',
  EntryStatus.rejected: 'rejected',
};
