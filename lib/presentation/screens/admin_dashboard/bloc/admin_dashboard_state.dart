part of 'admin_dashboard_bloc.dart';

abstract class AdminDashboardState extends Equatable {
  const AdminDashboardState();

  @override
  List<Object?> get props => [];
}

class AdminDashboardLoading extends AdminDashboardState {}

class AdminDashboardLoaded extends AdminDashboardState {
  final List<TournamentEntity> tournaments;
  final List<TeamUserShort> users;
  final List<TeamEntity> teams;
  final AdminStats stats;

  const AdminDashboardLoaded({
    required this.tournaments,
    required this.users,
    required this.teams,
    required this.stats,
  });

  AdminDashboardLoaded copyWith({
    List<TournamentEntity>? tournaments,
    List<TeamUserShort>? users,
    List<TeamEntity>? teams,
    AdminStats? stats,
  }) {
    return AdminDashboardLoaded(
      tournaments: tournaments ?? this.tournaments,
      users: users ?? this.users,
      teams: teams ?? this.teams,
      stats: stats ?? this.stats,
    );
  }

  @override
  List<Object?> get props => [tournaments, users, teams, stats];
}

class AdminDashboardError extends AdminDashboardState {
  final String errorMessage;

  const AdminDashboardError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
