part of 'admin_dashboard_bloc.dart';

@immutable
abstract class AdminDashboardEvent extends Equatable {
  const AdminDashboardEvent();

  @override
  List<Object> get props => [];
}

class AdminDashboardStarted extends AdminDashboardEvent {}

class AdminDashboardRefreshed extends AdminDashboardEvent {}

class AdminDashboardQueryChanged extends AdminDashboardEvent {
  final String query;
  final int tabIndex;

  const AdminDashboardQueryChanged(this.query, this.tabIndex);

  @override
  List<Object> get props => [query, tabIndex];
}

class AdminDeleteTournament extends AdminDashboardEvent {
  final String tournamentId;

  const AdminDeleteTournament(this.tournamentId);
}

class AdminDeleteTeam extends AdminDashboardEvent {
  final String teamId;

  const AdminDeleteTeam(this.teamId);
}

class AdminChangeUserRole extends AdminDashboardEvent {
  final String userId;
  final String newRole; // 'USER', 'MANAGER', 'ADMIN'
  const AdminChangeUserRole(this.userId, this.newRole);
}

class AdminToggleBanUser extends AdminDashboardEvent {
  final String userId;
  final String reason;
  final int? days;

  AdminToggleBanUser({required this.userId, required this.reason, this.days});
}

class AdminUnbanUser extends AdminDashboardEvent {
  final String userId;
  AdminUnbanUser(this.userId);
}

class AdminCancelTournament extends AdminDashboardEvent {
  final String tournamentId;
  const AdminCancelTournament(this.tournamentId);
}

class AdminToggleBanTeam extends AdminDashboardEvent {
  final String teamId;
  final bool ban;
  const AdminToggleBanTeam(this.teamId, this.ban);
}
