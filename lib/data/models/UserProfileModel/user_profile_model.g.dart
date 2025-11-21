// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      tournamentsPlayed: (json['tournamentsPlayed'] as num).toInt(),
      tournamentsWon: (json['tournamentsWon'] as num).toInt(),
      winrate: (json['winrate'] as num).toDouble(),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'tournamentsPlayed': instance.tournamentsPlayed,
      'tournamentsWon': instance.tournamentsWon,
      'winrate': instance.winrate,
    };
