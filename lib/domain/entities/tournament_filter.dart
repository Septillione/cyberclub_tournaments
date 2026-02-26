import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

enum TournamentSort {
  newest,
  oldest,
  popular;

  String toQueryParam() {
    switch (this) {
      case TournamentSort.newest:
        return 'NEWEST';
      case TournamentSort.oldest:
        return 'OLDEST';
      case TournamentSort.popular:
        return 'POPULAR';
    }
  }
}

class TournamentFilter {
  final Discipline? discipline;
  final TournamentStatus? status;
  final TeamMode? teamMode;
  final bool? isOnline;
  final TournamentSort? sortOrder;
  final String? searchQuery;

  const TournamentFilter({
    this.discipline,
    this.status,
    this.teamMode,
    this.isOnline,
    this.sortOrder,
    this.searchQuery,
  });

  TournamentFilter copyWith({
    Discipline? discipline,
    TournamentStatus? status,
    TeamMode? teamMode,
    bool? isOnline,
    TournamentSort? sortOrder,
    String? searchQuery,
    bool clearDiscipline = false,
    bool clearStatus = false,
    bool clearTeamMode = false,
    bool clearIsOnline = false,
    bool clearSortOrder = false,
    bool clearSearchQuery = false,
  }) {
    return TournamentFilter(
      discipline: clearDiscipline ? null : (discipline ?? this.discipline),
      status: clearStatus ? null : (status ?? this.status),
      teamMode: clearTeamMode ? null : (teamMode ?? this.teamMode),
      isOnline: clearIsOnline ? null : (isOnline ?? this.isOnline),
      sortOrder: clearSortOrder ? null : (sortOrder ?? this.sortOrder),
      searchQuery: clearSearchQuery ? null : (searchQuery ?? this.searchQuery),
    );
  }

  bool get isEmpty =>
      discipline == null &&
      status == null &&
      teamMode == null &&
      isOnline == null &&
      sortOrder == null &&
      (searchQuery == null || searchQuery!.isEmpty);

  bool get hasActiveFilters => !isEmpty;
}
