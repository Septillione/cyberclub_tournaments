import 'package:equatable/equatable.dart';

class AdminStats {
  final AdminTournamentStats tournaments;
  final AdminUserStats users;
  final AdminTeamStats teams;

  const AdminStats({
    required this.tournaments,
    required this.users,
    required this.teams,
  });
}

class AdminTournamentStats extends Equatable {
  final int total;
  final int live;
  final int open;

  AdminTournamentStats({
    required this.total,
    required this.live,
    required this.open,
  });

  @override
  List<Object?> get props => [total, live, open];
}

class AdminUserStats extends Equatable {
  final int total;
  final int inTeams;

  AdminUserStats({required this.total, required this.inTeams});

  @override
  List<Object?> get props => [total, inTeams];
}

class AdminTeamStats extends Equatable {
  final int total;
  final int active;

  const AdminTeamStats({required this.total, required this.active});

  @override
  List<Object?> get props => [total, active];
}
