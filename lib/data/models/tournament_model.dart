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
  final String type;
  final String? address;
  final String format;
  final String formatVersus;
  final String description;
  final String rules;
  final DateTime startDate;
  final TournamentStatus status;
  final int currentParticipants;
  final int maxParticipants;
  final String? firstPlace;
  final String? secondPlace;
  final String? thirdPlace;

  TournamentModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.discipline,
    required this.prizePool,
    required this.type,
    required this.address,
    required this.format,
    required this.formatVersus,
    required this.description,
    required this.rules,
    required this.startDate,
    required this.status,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.firstPlace,
    required this.secondPlace,
    required this.thirdPlace,
  });
}
