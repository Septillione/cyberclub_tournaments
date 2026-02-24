import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manager_dashboard_event.dart';
part 'manager_dashboard_state.dart';

class ManagerDashboardBloc
    extends Bloc<ManagerDashboardEvent, ManagerDashboardState> {
  final TournamentRepository _tournamentRepository;
  ManagerDashboardBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(ManagerDashboardLoading()) {
    on<ManagerDashboardStarted>(_onStarted);
  }

  Future<void> _onStarted(
    ManagerDashboardStarted event,
    Emitter<ManagerDashboardState> emit,
  ) async {
    emit(ManagerDashboardLoading());
    try {
      final tournaments = await _tournamentRepository
          .fetchTournamentsForManagerDashboard();
      emit(ManagerDashboardLoaded(tournaments: tournaments));
    } on AppException catch (e) {
      emit(ManagerDashboardError(errorMessage: e.message));
    } catch (e) {
      emit(ManagerDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
