// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeammateModel _$TeammateModelFromJson(Map<String, dynamic> json) =>
    _TeammateModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      isCaptain: json['isCaptain'] as bool? ?? false,
    );

Map<String, dynamic> _$TeammateModelToJson(_TeammateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'isCaptain': instance.isCaptain,
    };

_TeamApplicationModel _$TeamApplicationModelFromJson(
  Map<String, dynamic> json,
) => _TeamApplicationModel(
  id: json['id'] as String,
  playerName: json['playerName'] as String,
  playerAvatarUrl: json['playerAvatarUrl'] as String,
);

Map<String, dynamic> _$TeamApplicationModelToJson(
  _TeamApplicationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'playerName': instance.playerName,
  'playerAvatarUrl': instance.playerAvatarUrl,
};

_TeamListItemModel _$TeamListItemModelFromJson(Map<String, dynamic> json) =>
    _TeamListItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      tag: json['tag'] as String,
      avatarUrl: json['avatarUrl'] as String,
      isCurrentUserCaptain: json['isCurrentUserCaptain'] as bool,
      teammatesCount: (json['teammatesCount'] as num).toInt(),
      teammatesAvatarUrls:
          (json['teammatesAvatarUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TeamListItemModelToJson(_TeamListItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'avatarUrl': instance.avatarUrl,
      'isCurrentUserCaptain': instance.isCurrentUserCaptain,
      'teammatesCount': instance.teammatesCount,
      'teammatesAvatarUrls': instance.teammatesAvatarUrls,
    };

_TeamDetailModel _$TeamDetailModelFromJson(Map<String, dynamic> json) =>
    _TeamDetailModel(
      id: json['id'] as String,
      name: json['name'] as String,
      tag: json['tag'] as String,
      avatarUrl: json['avatarUrl'] as String,
      tournamentsCount: (json['tournamentsCount'] as num).toInt(),
      winsCount: (json['winsCount'] as num).toInt(),
      winrate: (json['winrate'] as num).toDouble(),
      isCurrentUserCaptain: json['isCurrentUserCaptain'] as bool,
      inviteLink: json['inviteLink'] as String,
      teammates:
          (json['teammates'] as List<dynamic>?)
              ?.map((e) => TeammateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tournaments:
          (json['tournaments'] as List<dynamic>?)
              ?.map((e) => TournamentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      applications:
          (json['applications'] as List<dynamic>?)
              ?.map(
                (e) => TeamApplicationModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TeamDetailModelToJson(_TeamDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'avatarUrl': instance.avatarUrl,
      'tournamentsCount': instance.tournamentsCount,
      'winsCount': instance.winsCount,
      'winrate': instance.winrate,
      'isCurrentUserCaptain': instance.isCurrentUserCaptain,
      'inviteLink': instance.inviteLink,
      'teammates': instance.teammates,
      'tournaments': instance.tournaments,
      'applications': instance.applications,
    };
