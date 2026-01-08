import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
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
    DateTime? createdAt,
    required String ownerId,
    @JsonKey(name: '_count') Map<String, int>? count,
    @Default([]) List<TeamMemberModel> members,
    @Default([]) List<TeamEntryModel> entries,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      _$TeamModelFromJson(json);
}

@freezed
abstract class TeamMemberModel with _$TeamMemberModel {
  const factory TeamMemberModel({
    required String id,
    required String userId,
    required String teamId,
    required TeamUserShort user,
  }) = _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);
}

@freezed
abstract class TeamUserShort with _$TeamUserShort {
  const factory TeamUserShort({
    required String id,
    required String nickname,
    String? avatarUrl,
  }) = _TeamUserShort;

  factory TeamUserShort.fromJson(Map<String, dynamic> json) =>
      _$TeamUserShortFromJson(json);
}

@freezed
abstract class TeamShortInfo with _$TeamShortInfo {
  const factory TeamShortInfo({
    required String id,
    required String name,
    required String tag,
    String? avatarUrl,
  }) = _TeamShortInfo;

  factory TeamShortInfo.fromJson(Map<String, dynamic> json) =>
      _$TeamShortInfoFromJson(json);
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
