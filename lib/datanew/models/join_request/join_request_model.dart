import 'package:cyberclub_tournaments/datanew/models/team/team_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_request_model.freezed.dart';
part 'join_request_model.g.dart';

@freezed
abstract class JoinRequestModel with _$JoinRequestModel {
  const factory JoinRequestModel({
    required String id,
    required String userId,
    required String teamId,
    required String status,
    required TeamUserShortModel user,
  }) = _JoinRequestModel;

  factory JoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestModelFromJson(json);
}
