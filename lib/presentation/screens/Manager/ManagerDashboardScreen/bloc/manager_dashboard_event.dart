part of 'manager_dashboard_bloc.dart';

@immutable
abstract class ManagerDashboardEvent extends Equatable {
  const ManagerDashboardEvent();

  @override
  List<Object> get props => [];
}

class ManagerDashboardStarted extends ManagerDashboardEvent {}
