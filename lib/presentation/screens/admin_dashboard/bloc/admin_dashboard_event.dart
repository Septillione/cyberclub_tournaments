part of 'admin_dashboard_bloc.dart';

abstract class AdminDashboardEvent extends Equatable {
  const AdminDashboardEvent();

  @override
  List<Object?> get props => [];
}

class AdminDashboardStarted extends AdminDashboardEvent {}

class AdminDashboardRefreshed extends AdminDashboardEvent {}

class AdminDashboardQueryChanged extends AdminDashboardEvent {
  final String query;
  final int tabIndex;

  const AdminDashboardQueryChanged(this.query, this.tabIndex);

  @override
  List<Object?> get props => [query, tabIndex];
}

class AdminDeleteTournament extends AdminDashboardEvent {
  final String tournamentId;

  const AdminDeleteTournament(this.tournamentId);

  @override
  List<Object?> get props => [tournamentId];
}

class AdminDeleteTeam extends AdminDashboardEvent {
  final String teamId;

  const AdminDeleteTeam(this.teamId);

  @override
  List<Object?> get props => [teamId];
}

class AdminToggleBanUser extends AdminDashboardEvent {
  final String userId;
  final String reason;
  final int? days;

  const AdminToggleBanUser({
    required this.userId,
    required this.reason,
    this.days,
  });

  @override
  List<Object?> get props => [userId, reason, days];
}

class AdminUnbanUser extends AdminDashboardEvent {
  final String userId;

  const AdminUnbanUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AdminChangeUserRole extends AdminDashboardEvent {
  final String userId;
  final UserRole newRole;

  const AdminChangeUserRole(this.userId, this.newRole);

  @override
  List<Object?> get props => [userId, newRole];
}

class AdminToggleBanTeam extends AdminDashboardEvent {
  final String teamId;
  final bool ban;

  const AdminToggleBanTeam(this.teamId, this.ban);

  @override
  List<Object?> get props => [teamId, ban];
}

class AdminCancelTournament extends AdminDashboardEvent {
  final String tournamentId;

  const AdminCancelTournament(this.tournamentId);

  @override
  List<Object?> get props => [tournamentId];
}
