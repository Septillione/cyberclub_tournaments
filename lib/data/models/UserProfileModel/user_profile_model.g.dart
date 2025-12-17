// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'USER',
  UserRole.manager: 'MANAGER',
  UserRole.admin: 'ADMIN',
};
