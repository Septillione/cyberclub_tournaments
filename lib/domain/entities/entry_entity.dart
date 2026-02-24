import 'package:equatable/equatable.dart';

enum EntryStatus {
  pending,
  accepted,
  rejected;

  String get title {
    switch (this) {
      case EntryStatus.pending:
        return 'Ожидает';
      case EntryStatus.accepted:
        return 'Принята';
      case EntryStatus.rejected:
        return 'Отклонена';
    }
  }
}

class EntryEntity extends Equatable {
  final String id;
  final String tournamentId;
  final String teamId;
  final List<String> playerIds;
  final EntryStatus status;

  const EntryEntity({
    required this.id,
    required this.tournamentId,
    required this.teamId,
    this.playerIds = const [],
    required this.status,
  });

  @override
  List<Object?> get props => [id, tournamentId, teamId, playerIds, status];
}
