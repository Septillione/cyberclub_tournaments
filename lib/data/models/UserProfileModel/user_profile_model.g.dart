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
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => UserEntryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isBanned: json['isBanned'] as bool? ?? false,
      stats: json['stats'] == null
          ? const UserStatsModel()
          : UserStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'entries': instance.entries,
      'isBanned': instance.isBanned,
      'stats': instance.stats,
    };

const _$UserRoleEnumMap = {
  UserRole.user: 'USER',
  UserRole.manager: 'MANAGER',
  UserRole.admin: 'ADMIN',
};

_UserEntryModel _$UserEntryModelFromJson(Map<String, dynamic> json) =>
    _UserEntryModel(
      id: json['id'] as String,
      status: json['status'] as String,
      tournament: TournamentModel.fromJson(
        json['tournament'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$UserEntryModelToJson(_UserEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'tournament': instance.tournament,
    };

_UserStatsModel _$UserStatsModelFromJson(Map<String, dynamic> json) =>
    _UserStatsModel(
      tournamentsPlayed: (json['tournamentsPlayed'] as num?)?.toInt() ?? 0,
      tournamentsWon: (json['tournamentsWon'] as num?)?.toInt() ?? 0,
      winrate: (json['winrate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$UserStatsModelToJson(_UserStatsModel instance) =>
    <String, dynamic>{
      'tournamentsPlayed': instance.tournamentsPlayed,
      'tournamentsWon': instance.tournamentsWon,
      'winrate': instance.winrate,
    };
