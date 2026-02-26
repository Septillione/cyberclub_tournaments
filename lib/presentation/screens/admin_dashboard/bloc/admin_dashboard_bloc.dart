import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_tournaments_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/get_admin_stats_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/cancel_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/delete_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/search_teams_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/delete_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/ban_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/search_users_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/ban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/unban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_user_role_usecase.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';

const _debounceDuration = Duration(milliseconds: 500);

EventTransformer<Event> _debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  final FetchTournamentsUsecase _getTournaments;
  final GetAdminStatsUsecase _getAdminStats;
  final CancelTournamentUsecase _cancelTournament;
  final DeleteTournamentUsecase _deleteTournament;
  final SearchTeamsUsecase _searchTeams;
  final DeleteTeamUsecase _deleteTeam;
  final BanTeamUseCase _banTeam;
  final SearchUsersUseCase _searchUsers;
  final BanUserUseCase _banUser;
  final UnbanUserUseCase _unbanUser;
  final ChangeUserRoleUseCase _changeUserRole;

  AdminDashboardBloc({
    required FetchTournamentsUsecase getTournaments,
    required GetAdminStatsUsecase getAdminStats,
    required CancelTournamentUsecase cancelTournament,
    required DeleteTournamentUsecase deleteTournament,
    required SearchTeamsUsecase searchTeams,
    required DeleteTeamUsecase deleteTeam,
    required BanTeamUseCase banTeam,
    required SearchUsersUseCase searchUsers,
    required BanUserUseCase banUser,
    required UnbanUserUseCase unbanUser,
    required ChangeUserRoleUseCase changeUserRole,
  }) : _getTournaments = getTournaments,
       _getAdminStats = getAdminStats,
       _cancelTournament = cancelTournament,
       _deleteTournament = deleteTournament,
       _searchTeams = searchTeams,
       _deleteTeam = deleteTeam,
       _banTeam = banTeam,
       _searchUsers = searchUsers,
       _banUser = banUser,
       _unbanUser = unbanUser,
       _changeUserRole = changeUserRole,
       super(AdminDashboardLoading()) {
    on<AdminDashboardStarted>(_onStarted);
    on<AdminDashboardRefreshed>(_onStarted);
    on<AdminDashboardQueryChanged>(
      _onSearchChanged,
      transformer: _debounce(_debounceDuration),
    );
    on<AdminDeleteTournament>(_onDeleteTournament);
    on<AdminDeleteTeam>(_onDeleteTeam);
    on<AdminToggleBanUser>(_onBanUser);
    on<AdminUnbanUser>(_onUnbanUser);
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
        _getTournaments(null),
        _searchUsers(null),
        _searchTeams(null),
        _getAdminStats(),
      ]);

      emit(
        AdminDashboardLoaded(
          tournaments: results[0] as List<TournamentEntity>,
          users: results[1] as List<TeamUserShort>,
          teams: results[2] as List<TeamEntity>,
          stats: results[3] as AdminStats,
        ),
      );
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (_) {
      emit(
        const AdminDashboardError(errorMessage: 'Не удалось загрузить данные'),
      );
    }
  }

  Future<void> _onSearchChanged(
    AdminDashboardQueryChanged event,
    Emitter<AdminDashboardState> emit,
  ) async {
    final current = state;
    if (current is! AdminDashboardLoaded) return;

    try {
      switch (event.tabIndex) {
        case 0:
          final tournaments = await _getTournaments(
            TournamentFilter(searchQuery: event.query),
          );
          emit(current.copyWith(tournaments: tournaments));
        case 1:
          final users = await _searchUsers(event.query);
          emit(current.copyWith(users: users));
        case 2:
          final teams = await _searchTeams(event.query);
          emit(current.copyWith(teams: teams));
      }
    } catch (_) {
      emit(const AdminDashboardError(errorMessage: 'Ошибка поиска'));
    }
  }

  Future<void> _onDeleteTournament(
    AdminDeleteTournament event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(() => _deleteTournament(event.tournamentId), emit);
  }

  Future<void> _onDeleteTeam(
    AdminDeleteTeam event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(() => _deleteTeam(event.teamId), emit);
  }

  Future<void> _onBanUser(
    AdminToggleBanUser event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(
      () => _banUser(
        userId: event.userId,
        reason: event.reason,
        days: event.days,
      ),
      emit,
    );
  }

  Future<void> _onUnbanUser(
    AdminUnbanUser event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(() => _unbanUser(event.userId), emit);
  }

  Future<void> _onChangeUserRole(
    AdminChangeUserRole event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(
      () => _changeUserRole(event.userId, event.newRole),
      emit,
    );
  }

  Future<void> _onBanTeam(
    AdminToggleBanTeam event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(() => _banTeam(event.teamId, event.ban), emit);
  }

  Future<void> _onCancelTournament(
    AdminCancelTournament event,
    Emitter<AdminDashboardState> emit,
  ) async {
    await _executeAndRefresh(() => _cancelTournament(event.tournamentId), emit);
  }

  Future<void> _executeAndRefresh(
    Future<void> Function() action,
    Emitter<AdminDashboardState> emit,
  ) async {
    try {
      await action();
      add(AdminDashboardStarted());
    } on AppException catch (e) {
      emit(AdminDashboardError(errorMessage: e.message));
    } catch (_) {
      emit(const AdminDashboardError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
