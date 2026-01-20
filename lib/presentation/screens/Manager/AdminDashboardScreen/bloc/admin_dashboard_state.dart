part of 'admin_dashboard_bloc.dart';

sealed class AdminDashboardState extends Equatable {
  const AdminDashboardState();

  @override
  List<Object> get props => [];
}

class AdminDashboardLoading extends AdminDashboardState {}

class AdminDashboardLoaded extends AdminDashboardState {
  final List<TournamentModel> tournaments;
  final List<TeamUserShort> users;
  final List<TeamModel> teams;

  final Map<String, dynamic> stats;

  const AdminDashboardLoaded({
    required this.tournaments,
    required this.users,
    required this.teams,
    required this.stats,
  });

  @override
  List<Object> get props => [tournaments, users, teams, stats];

  AdminDashboardLoaded copyWith({
    List<TournamentModel>? tournaments,
    List<TeamUserShort>? users,
    List<TeamModel>? teams,
    Map<String, dynamic>? stats,
  }) {
    return AdminDashboardLoaded(
      tournaments: tournaments ?? this.tournaments,
      users: users ?? this.users,
      teams: teams ?? this.teams,
      stats: stats ?? this.stats,
    );
  }
}

class AdminDashboardError extends AdminDashboardState {
  final String errorMessage;

  const AdminDashboardError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
