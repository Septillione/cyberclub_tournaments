import 'package:cyberclub_tournaments/datanew/models/Entry/entry_model.dart';
import 'package:cyberclub_tournaments/domain/entities/entry_entity.dart';

class EntryMapper {
  static EntryEntity toEntity(EntryModel model) {
    return EntryEntity(
      id: model.id,
      tournamentId: model.tournamentId,
      teamId: model.teamId,
      playerIds: model.playerIds,
      status: statusToEntity(model.status),
    );
  }

  static EntryModel toModel(EntryEntity entity) {
    return EntryModel(
      id: entity.id,
      tournamentId: entity.tournamentId,
      teamId: entity.teamId,
      playerIds: entity.playerIds,
      status: statusToJson(entity.status),
    );
  }

  static EntryStatus statusToEntity(String status) {
    switch (status) {
      case 'accepted':
        return EntryStatus.accepted;
      case 'rejected':
        return EntryStatus.rejected;
      case 'pending':
      default:
        return EntryStatus.pending;
    }
  }

  static String statusToJson(EntryStatus status) {
    switch (status) {
      case EntryStatus.pending:
        return 'pending';
      case EntryStatus.accepted:
        return 'accepted';
      case EntryStatus.rejected:
        return 'rejected';
    }
  }
}
