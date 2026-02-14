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
  socialMedia: json['socialMedia'] as String?,
  gamesList:
      (json['gamesList'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  ownerId: json['ownerId'] as String,
  count: (json['_count'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map((e) => TeamEntryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isBanned: json['isBanned'] as bool? ?? false,
  stats: json['stats'] == null
      ? const TeamStatsModel()
      : TeamStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
      'socialMedia': instance.socialMedia,
      'gamesList': instance.gamesList,
      'createdAt': instance.createdAt?.toIso8601String(),
      'ownerId': instance.ownerId,
      '_count': instance.count,
      'members': instance.members,
      'entries': instance.entries,
      'isBanned': instance.isBanned,
      'stats': instance.stats,
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
      isBanned: json['isBanned'] as bool? ?? false,
    );

Map<String, dynamic> _$TeamUserShortToJson(_TeamUserShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'isBanned': instance.isBanned,
    };

_TeamShortInfo _$TeamShortInfoFromJson(Map<String, dynamic> json) =>
    _TeamShortInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      tag: json['tag'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$TeamShortInfoToJson(_TeamShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'avatarUrl': instance.avatarUrl,
    };

_TeamEntryModel _$TeamEntryModelFromJson(Map<String, dynamic> json) =>
    _TeamEntryModel(
      id: json['id'] as String,
      status: json['status'] as String,
      tournament: TournamentModel.fromJson(
        json['tournament'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$TeamEntryModelToJson(_TeamEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'tournament': instance.tournament,
    };

_TeamStatsModel _$TeamStatsModelFromJson(Map<String, dynamic> json) =>
    _TeamStatsModel(
      tournamentsPlayed: (json['tournamentsPlayed'] as num?)?.toInt() ?? 0,
      tournamentsWon: (json['tournamentsWon'] as num?)?.toInt() ?? 0,
      winrate: (json['winrate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$TeamStatsModelToJson(_TeamStatsModel instance) =>
    <String, dynamic>{
      'tournamentsPlayed': instance.tournamentsPlayed,
      'tournamentsWon': instance.tournamentsWon,
      'winrate': instance.winrate,
    };
