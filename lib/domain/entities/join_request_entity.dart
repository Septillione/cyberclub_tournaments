import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:equatable/equatable.dart';

enum JoinRequestStatus {
  pending,
  accepted,
  rejected;

  String get title {
    switch (this) {
      case JoinRequestStatus.pending:
        return 'Ожидает';
      case JoinRequestStatus.accepted:
        return 'Принята';
      case JoinRequestStatus.rejected:
        return 'Отклонена';
    }
  }
}

class JoinRequestEntity extends Equatable {
  final String id;
  final String userId;
  final String teamId;
  final JoinRequestStatus status;
  final TeamUserShort user;

  const JoinRequestEntity({
    required this.id,
    required this.userId,
    required this.teamId,
    required this.status,
    required this.user,
  });

  @override
  List<Object?> get props => [id, userId, teamId, status, user];
}
