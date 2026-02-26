import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_organized_tournaments_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

part 'manager_dashboard_event.dart';
part 'manager_dashboard_state.dart';

class ManagerDashboardBloc
    extends Bloc<ManagerDashboardEvent, ManagerDashboardState> {
  final FetchOrganizedTournamentsUsecase _getOrganizedTournaments;

  ManagerDashboardBloc({
    required FetchOrganizedTournamentsUsecase getOrganizedTournaments,
  }) : _getOrganizedTournaments = getOrganizedTournaments,
       super(ManagerDashboardLoading()) {
    on<ManagerDashboardStarted>(_onStarted);
  }

  Future<void> _onStarted(
    ManagerDashboardStarted event,
    Emitter<ManagerDashboardState> emit,
  ) async {
    emit(ManagerDashboardLoading());
    try {
      final tournaments = await _getOrganizedTournaments();
      emit(ManagerDashboardLoaded(tournaments: tournaments));
    } on AppException catch (e) {
      emit(ManagerDashboardError(errorMessage: e.message));
    } catch (_) {
      emit(
        const ManagerDashboardError(
          errorMessage: 'Не удалось загрузить список турниров',
        ),
      );
    }
  }
}
