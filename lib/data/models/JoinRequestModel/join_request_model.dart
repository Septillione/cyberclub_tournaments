import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_request_model.freezed.dart';
part 'join_request_model.g.dart';

enum JoinRequestStatus { PENDING, ACCEPTED, REJECTED }

@freezed
abstract class JoinRequestModel with _$JoinRequestModel {
  const factory JoinRequestModel({
    required String id,
    required String userId,
    required String teamId,
    required JoinRequestStatus status,
    required TeamUserShort user,
  }) = _JoinRequestModel;

  factory JoinRequestModel.fromJson(Map<String, dynamic> json) =>
      _$JoinRequestModelFromJson(json);
}
