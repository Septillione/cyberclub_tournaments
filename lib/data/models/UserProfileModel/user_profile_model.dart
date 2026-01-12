import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

enum UserRole {
  @JsonValue('USER')
  user,
  @JsonValue('MANAGER')
  manager,
  @JsonValue('ADMIN')
  admin,
}

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String nickname,
    required String email,
    required UserRole role,
    String? avatarUrl,
    required String? bio,
    @Default([]) List<UserEntryModel> entries,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
abstract class UserEntryModel with _$UserEntryModel {
  const factory UserEntryModel({
    required String id,
    required String status,
    required TournamentModel tournament,
  }) = _UserEntryModel;

  factory UserEntryModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntryModelFromJson(json);
}
