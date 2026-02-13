import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'admin_dashboard_state.dart';
part 'admin_dashboard_event.dart';

const _duration = Duration(milliseconds: 500);
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final TournamentRepository _tournamentRepository;
  final UserRepository _userRepository;
  final TeamRepository _teamRepository;

  AdminDashboardBloc({
    required TournamentRepository tournamentRepository,
    required UserRepository userRepository,
    required TeamRepository teamRepository,
  }) : _tournamentRepository = tournamentRepository,
       _userRepository = userRepository,
       _teamRepository = teamRepository,
       super(AdminDashboardLoading()) {
    on<AdminDashboardStarted>(_onStarted);
    on<AdminDashboardRefreshed>(_onStarted);

    on<AdminDashboardQueryChanged>(
      _onSearchChanged,
      transformer: debounce(_duration),
    );

    on<AdminDeleteTournament>(_onDeleteTournament);
    on<AdminDeleteTeam>(_onDeleteTeam);

    on<AdminToggleBanUser>(_onBanUser);
    on<AdminChangeUserRole>(_onChangeUserRole);
    on<AdminToggleBanTeam>(_onBanTeam);
    on<AdminCancelTournament>(_onCancelTournament);
  }

  Future<void> _onStarted(
    AdminDashboardEvent event,
    Emitter<AdminDashboardState> emit,
  ) async {
    emit(AdminDashboardLoading());
    try {
      final results = await Future.wait([
        _tournamentRepository.fetchTournaments(),
        _userRepository.fetchUsersForAdminDashboard(null),
        _teamRepository.searchTeams(''),
        _tournamentRepository.getAdminStats(),
      ]);

      emit(
        AdminDashboardLoaded(
          tournaments: results[0] as List<TournamentModel>,
          users: results[1] as List<TeamUserShort>,
          teams: results[2] as List<TeamModel>,
          stats: results[3] as Map<String, dynamic>,
        ),
      );
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onSearchChanged(
    AdminDashboardQueryChanged event,
    Emitter<AdminDashboardState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AdminDashboardLoaded) return;

    try {
      if (event.tabIndex == 0) {
        final tournaments = await _tournamentRepository.fetchTournaments(
          filter: TournamentFilter(searchQuery: event.query),
        );
        emit(currentState.copyWith(tournaments: tournaments));
      } else if (event.tabIndex == 1) {
        final users = await _userRepository.fetchUsersForAdminDashboard(
          event.query,
        );
        emit(currentState.copyWith(users: users));
      } else if (event.tabIndex == 2) {
        final teams = await _teamRepository.searchTeams(event.query);
        emit(currentState.copyWith(teams: teams));
      }
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
      print('Search error: $e');
    }
  }

  Future<void> _onDeleteTournament(
    AdminDeleteTournament event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _tournamentRepository.deleteTournament(event.tournamentId);
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
      print('Delete tournament error: $e');
    }
  }

  Future<void> _onDeleteTeam(
    AdminDeleteTeam event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _teamRepository.deleteTeam(event.teamId);
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
      print('Delete team error: $e');
    }
  }

  Future<void> _onBanUser(
    AdminToggleBanUser event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _userRepository.banUser(
        userId: event.userId,
        reason: event.reason,
        days: event.days,
      );
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      print('Ban user error: $e');
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onUnbanUser(
    AdminUnbanUser event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _userRepository.unbanUser(event.userId);
      add(AdminDashboardStarted()); // Перезагружаем список
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      print('Unban user error: $e');
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onChangeUserRole(
    AdminChangeUserRole event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _userRepository.changeUserRole(event.userId, event.newRole);
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      print('Change user role error: $e');
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onBanTeam(
    AdminToggleBanTeam event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _teamRepository.banTeam(event.teamId, event.ban);
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      print('Ban team error: $e');
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }

  Future<void> _onCancelTournament(
    AdminCancelTournament event,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await _tournamentRepository.cancelTournament(event.tournamentId);
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (e) {
      print('Cancel tournament error: $e');
      emit(AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
