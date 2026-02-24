import 'package:cyberclub_tournaments/datanew/models/tournament/tournament_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    required String id,
    required String name,
    required String tag,
    String? avatarUrl,
    String? description,
    String? socialMedia,
    @Default([]) List<String>? gamesList,
    DateTime? createdAt,
    required String ownerId,
    @JsonKey(name: '_count') Map<String, int>? count,
    @Default([]) List<TeamMemberModel> members,
    @Default([]) List<TeamEntryModel> entries,
    @Default(false) bool isBanned,
    @Default(TeamStatsModel()) TeamStatsModel stats,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}

@freezed
abstract class TeamUserShortModel with _$TeamUserShortModel {
  const factory TeamUserShortModel({
    required String id,
    required String nickname,
    String? avatarUrl,
    @Default(false) bool isBanned,
  }) = _TeamUserShortModel;

  factory TeamUserShortModel.fromJson(Map<String, dynamic> json) =>
      _$TeamUserShortModelFromJson(json);
}

@freezed
abstract class TeamMemberModel with _$TeamMemberModel {
  const factory TeamMemberModel({
    required String id,
    required String userId,
    required String teamId,
    required TeamUserShortModel user,
  }) = _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);
}

@freezed
abstract class TeamEntryModel with _$TeamEntryModel {
  const factory TeamEntryModel({
    required String id,
    required String status,
    required TournamentModel tournament,
  }) = _TeamEntryModel;

  factory TeamEntryModel.fromJson(Map<String, dynamic> json) =>
      _$TeamEntryModelFromJson(json);
}

@freezed
abstract class TeamStatsModel with _$TeamStatsModel {
  const factory TeamStatsModel({
    @Default(0) int tournamentsPlayed,
    @Default(0) int tournamentsWon,
    @Default(0.0) double winrate,
  }) = _TeamStatsModel;

  factory TeamStatsModel.fromJson(Map<String, dynamic> json) =>
      _$TeamStatsModelFromJson(json);
}

@freezed
abstract class TeamShortInfoModel with _$TeamShortInfoModel {
  const factory TeamShortInfoModel({
    required String id,
    required String name,
    required String tag,
    String? avatarUrl,
  }) = _TeamShortInfoModel;

  factory TeamShortInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TeamShortInfoModelFromJson(json);
}
