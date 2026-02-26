import 'package:cyberclub_tournaments/data/models/tournament/tournament_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String nickname,
    required String email,
    required String role,
    String? avatarUrl,
    String? bio,
    @Default([]) List<UserEntryModel> entries,
    @Default(false) bool isBanned,
    @Default(UserStatsModel()) UserStatsModel stats,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
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

@freezed
abstract class UserStatsModel with _$UserStatsModel {
  const factory UserStatsModel({
    @Default(0) int tournamentsPlayed,
    @Default(0) int tournamentsWon,
    @Default(0.0) double winrate,
  }) = _UserStatsModel;

  factory UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsModelFromJson(json);
}
