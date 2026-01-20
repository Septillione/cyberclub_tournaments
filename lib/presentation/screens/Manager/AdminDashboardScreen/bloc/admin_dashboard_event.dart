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

class AdminBanUser extends AdminDashboardEvent {
  final String userId;

  const AdminBanUser(this.userId);
}
