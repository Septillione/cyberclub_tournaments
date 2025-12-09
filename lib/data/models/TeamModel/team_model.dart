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
    required String ownerId,
    @Default([]) List<TeamMemberModel> members,
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

// @freezed
// abstract class TeammateModel with _$TeammateModel {
//   const factory TeammateModel({
//     required String id,
//     required String name,
//     required String avatarUrl,
//     @Default(false) bool isCaptain,
//   }) = _TeammateModel;

//   factory TeammateModel.fromJson(Map<String, dynamic> json) =>
//       _$TeammateModelFromJson(json);
// }

// @freezed
// abstract class TeamApplicationModel with _$TeamApplicationModel {
//   const factory TeamApplicationModel({
//     required String id,
//     required String playerName,
//     required String playerAvatarUrl,
//   }) = _TeamApplicationModel;

//   factory TeamApplicationModel.fromJson(Map<String, dynamic> json) =>
//       _$TeamApplicationModelFromJson(json);
// }

// @freezed
// abstract class TeamListItemModel with _$TeamListItemModel {
//   const factory TeamListItemModel({
//     required String id,
//     required String name,
//     required String tag,
//     required String avatarUrl,
//     required bool isCurrentUserCaptain,
//     required int teammatesCount,
//     @Default([]) List<String> teammatesAvatarUrls,
//   }) = _TeamListItemModel;

//   factory TeamListItemModel.fromJson(Map<String, dynamic> json) =>
//       _$TeamListItemModelFromJson(json);
// }

// @freezed
// abstract class TeamDetailModel with _$TeamDetailModel {
//   const factory TeamDetailModel({
//     required String id,
//     required String name,
//     required String tag,
//     required String avatarUrl,
//     required int tournamentsCount,
//     required int winsCount,
//     required double winrate,
//     required bool isCurrentUserCaptain,
//     required String inviteLink,
//     @Default([]) List<TeammateModel> teammates,
//     @Default([]) List<TournamentModel> tournaments,
//     @Default([]) List<TeamApplicationModel> applications,
//   }) = _TeamDetailModel;

//   factory TeamDetailModel.fromJson(Map<String, dynamic> json) =>
//       _$TeamDetailModelFromJson(json);
// }
