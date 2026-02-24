import 'package:cyberclub_tournaments/datanew/mappers/team_mapper.dart';
import 'package:cyberclub_tournaments/datanew/models/join_request/join_request_model.dart';
import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';

class JoinRequestMapper {
  static JoinRequestEntity toEntity(JoinRequestModel model) {
    return JoinRequestEntity(
      id: model.id,
      userId: model.userId,
      teamId: model.teamId,
      status: statusToEntity(model.status),
      user: TeamMapper.userShortToEntity(model.user),
    );
  }

  static JoinRequestModel toModel(JoinRequestEntity entity) {
    return JoinRequestModel(
      id: entity.id,
      userId: entity.userId,
      teamId: entity.teamId,
      status: statusToJson(entity.status),
      user: TeamMapper.userShortToModel(entity.user),
    );
  }

  static JoinRequestStatus statusToEntity(String status) {
    switch (status) {
      case 'ACCEPTED':
        return JoinRequestStatus.accepted;
      case 'REJECTED':
        return JoinRequestStatus.rejected;
      case 'PENDING':
        return JoinRequestStatus.pending;
      default:
        return JoinRequestStatus.pending;
    }
  }

  static String statusToJson(JoinRequestStatus status) {
    switch (status) {
      case JoinRequestStatus.accepted:
        return 'ACCEPTED';
      case JoinRequestStatus.rejected:
        return 'REJECTED';
      case JoinRequestStatus.pending:
        return 'PENDING';
    }
  }
}
