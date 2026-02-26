part of 'manager_dashboard_bloc.dart';

abstract class ManagerDashboardState extends Equatable {
  const ManagerDashboardState();

  @override
  List<Object?> get props => [];
}

class ManagerDashboardLoading extends ManagerDashboardState {}

class ManagerDashboardLoaded extends ManagerDashboardState {
  final List<TournamentEntity> tournaments;

  const ManagerDashboardLoaded({required this.tournaments});

  @override
  List<Object?> get props => [tournaments];
}

class ManagerDashboardError extends ManagerDashboardState {
  final String errorMessage;

  const ManagerDashboardError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
