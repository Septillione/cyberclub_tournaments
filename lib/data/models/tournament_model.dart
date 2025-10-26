enum TournamentStatus {
  announced,
  registrationOpened,
  registrationClosed,
  live,
  finished,
  cancelled,
}

class TournamentModel {
  final String id;
  final String title;
  final String imageUrl;
  final String discipline;
  final String prizePool;
  final DateTime startDate;
  final TournamentStatus status;
  final int currentParticipants;
  final int maxParticipants;

  TournamentModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.discipline,
    required this.prizePool,
    required this.startDate,
    required this.status,
    required this.currentParticipants,
    required this.maxParticipants,
  });
}
