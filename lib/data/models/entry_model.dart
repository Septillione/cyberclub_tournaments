import 'package:equatable/equatable.dart';

enum EntryStatus { pending, accepted, rejected }

class EntryModel extends Equatable {
  final String id;
  final String tournamentId;
  final String teamId;
  final List<String> playerIds;
  final EntryStatus status;

  const EntryModel({
    required this.id,
    required this.tournamentId,
    required this.teamId,
    required this.playerIds,
    required this.status,
  });

  @override
  List<Object> get props => [id, tournamentId, teamId, playerIds, status];
}
