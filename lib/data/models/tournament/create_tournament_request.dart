class CreateTournamentRequest {
  final String title;
  final String description;
  final String rules;
  final String discipline;
  final DateTime startDate;
  final int maxParticipants;
  final String bracketType;
  final String teamMode;
  final bool isOnline;
  final String? address;
  final String? imageUrl;
  final List<Map<String, String>> prizes;

  const CreateTournamentRequest({
    required this.title,
    required this.description,
    required this.rules,
    required this.discipline,
    required this.startDate,
    required this.maxParticipants,
    required this.bracketType,
    required this.teamMode,
    required this.isOnline,
    this.address,
    this.imageUrl,
    this.prizes = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'rules': rules,
      'discipline': discipline,
      'startDate': startDate.toIso8601String(),
      'maxParticipants': maxParticipants,
      'bracketType': bracketType,
      'teamMode': teamMode,
      'isOnline': isOnline,
      'address': address,
      'imageUrl': imageUrl,
      'prizes': prizes,
    };
  }
}
