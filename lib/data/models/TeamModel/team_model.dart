import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeammateModel with _$TeammateModel {
  const factory TeammateModel({
    required String id,
    required String name,
    required String avatarUrl,
    @Default(false) bool isCaptain,
  }) = _TeammateModel;

  factory TeammateModel.fromJson(Map<String, dynamic> json) =>
      _$TeammateModelFromJson(json);
}

@freezed
abstract class TeamApplicationModel with _$TeamApplicationModel {
  const factory TeamApplicationModel({
    required String id,
    required String playerName,
    required String playerAvatarUrl,
  }) = _TeamApplicationModel;

  factory TeamApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$TeamApplicationModelFromJson(json);
}

@freezed
abstract class TeamListItemModel with _$TeamListItemModel {
  const factory TeamListItemModel({
    required String id,
    required String name,
    required String tag,
    required String avatarUrl,
    required bool isCurrentUserCaptain,
    required int teammatesCount,
    @Default([]) List<String> teammatesAvatarUrls,
  }) = _TeamListItemModel;

  factory TeamListItemModel.fromJson(Map<String, dynamic> json) =>
      _$TeamListItemModelFromJson(json);
}

@freezed
abstract class TeamDetailModel with _$TeamDetailModel {
  const factory TeamDetailModel({
    required String id,
    required String name,
    required String tag,
    required String avatarUrl,
    required int tournamentsCount,
    required int winsCount,
    required double winrate,
    required bool isCurrentUserCaptain,
    required String inviteLink,
    @Default([]) List<TeammateModel> teammates,
    @Default([]) List<TournamentModel> tournaments,
    @Default([]) List<TeamApplicationModel> applications,
  }) = _TeamDetailModel;

  factory TeamDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TeamDetailModelFromJson(json);
}
