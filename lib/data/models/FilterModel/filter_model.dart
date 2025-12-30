import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';

class TournamentFilter {
  final Discipline? discipline;
  final TournamentStatus? status;
  final TeamMode? teamMode;
  final String? searchQuery;

  const TournamentFilter({
    this.discipline,
    this.status,
    this.teamMode,
    this.searchQuery,
  });

  TournamentFilter copyWith({
    Discipline? discipline,
    TournamentStatus? status,
    TeamMode? teamMode,
    String? searchQuery,
    bool clearDiscipline = false,
    bool clearStatus = false,
    bool clearTeamMode = false,
    bool clearSearchQuery = false,
  }) {
    return TournamentFilter(
      discipline: clearDiscipline ? null : (discipline ?? this.discipline),
      status: clearStatus ? null : (status ?? this.status),
      teamMode: clearTeamMode ? null : (teamMode ?? this.teamMode),
      searchQuery: clearSearchQuery ? null : (searchQuery ?? this.searchQuery),
    );
  }

  bool get isEmpty =>
      discipline == null &&
      status == null &&
      teamMode == null &&
      (searchQuery == null || searchQuery!.isEmpty);
}
