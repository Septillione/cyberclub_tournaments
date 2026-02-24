class AdminStats {
  final TournamentStats tournaments;
  final UserStats users;
  final TeamStats teams;

  const AdminStats({
    required this.tournaments,
    required this.users,
    required this.teams,
  });
}

class TournamentStats {
  final int total;
  final int live;
  final int open;

  const TournamentStats({
    required this.total,
    required this.live,
    required this.open,
  });
}

class UserStats {
  final int total;
  final int inTeams;

  const UserStats({required this.total, required this.inTeams});
}

class TeamStats {
  final int total;
  final int active;

  const TeamStats({required this.total, required this.active});
}
