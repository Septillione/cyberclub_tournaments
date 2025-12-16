// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  id: json['id'] as String,
  name: json['name'] as String,
  tag: json['tag'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  description: json['description'] as String?,
  ownerId: json['ownerId'] as String,
  count: (json['_count'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
      'ownerId': instance.ownerId,
      '_count': instance.count,
      'members': instance.members,
    };

_TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) =>
    _TeamMemberModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      teamId: json['teamId'] as String,
      user: TeamUserShort.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamMemberModelToJson(_TeamMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'teamId': instance.teamId,
      'user': instance.user,
    };

_TeamUserShort _$TeamUserShortFromJson(Map<String, dynamic> json) =>
    _TeamUserShort(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$TeamUserShortToJson(_TeamUserShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
    };
