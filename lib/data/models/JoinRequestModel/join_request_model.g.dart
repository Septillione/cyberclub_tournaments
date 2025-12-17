// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JoinRequestModel _$JoinRequestModelFromJson(Map<String, dynamic> json) =>
    _JoinRequestModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      teamId: json['teamId'] as String,
      status: $enumDecode(_$JoinRequestStatusEnumMap, json['status']),
      user: TeamUserShort.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JoinRequestModelToJson(_JoinRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'teamId': instance.teamId,
      'status': _$JoinRequestStatusEnumMap[instance.status]!,
      'user': instance.user,
    };

const _$JoinRequestStatusEnumMap = {
  JoinRequestStatus.PENDING: 'PENDING',
  JoinRequestStatus.ACCEPTED: 'ACCEPTED',
  JoinRequestStatus.REJECTED: 'REJECTED',
};
