import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/network/api_client.dart';
import 'package:cyberclub_tournaments/data/datasources/auth_local_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/auth_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/notification_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/team_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/tournament_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/datasources/user_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository_impl.dart';
import 'package:cyberclub_tournaments/data/repositories/notification_repository_impl.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository_impl.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository_impl.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository_impl.dart';
import 'package:cyberclub_tournaments/domain/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/domain/repositories/notification_repository.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_role_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/is_logged_in_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/login_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/logout_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/register_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/accept_invite_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/decline_invite_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/notification/fetch_notifications_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/accept_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/ban_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/create_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/delete_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/fetch_team_details_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/fetch_user_teams_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/get_join_requests_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/invite_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/join_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/kick_teammate_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/leave_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/promote_teammate_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/reject_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/search_teams_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/search_users_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/send_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/update_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/upload_team_logo_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/cancel_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/create_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/delete_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/disqualify_participant_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_tournament_by_id_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_tournaments_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_user_tournaments_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/finish_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/get_admin_stats_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/join_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/start_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/update_match_score_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/update_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/ban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_password_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_user_role_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/fetch_user_profile_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/unban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/update_user_profile_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/upload_user_avatar_usecase.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/register/bloc/register_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_team/bloc/create_team_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/bloc/create_tournament_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/invite_player/bloc/invite_player_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/manager_dashboard/bloc/manager_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/notifications/bloc/notification_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/bloc/tournament_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/bloc/user_tournaments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // _initCore();
  // _initData();
  // _initDomain();
  // _initPresentation();

  print("DI: Start init"); // <---
  _initCore();
  print("DI: Core init done"); // <---
  _initData();
  print("DI: Data init done"); // <---
  _initDomain();
  print("DI: Domain init done"); // <---
  _initPresentation();
  print("DI: Presentation init done"); // <---
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

void _initCore() {
  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      localDataSource: serviceLocator(),
      onBanned: (message) {
        final context = rootNavigatorKey.currentContext;
        if (context != null) {
          GoRouter.of(context).go('/ban', extra: message);
        }
        // AppRouter.router.go('/ban', extra: message);
      },
      onUnauthorized: () {
        final context = rootNavigatorKey.currentContext;
        if (context != null) {
          GoRouter.of(context).go('/login');
        }
        // AppRouter.router.go('/login');
      },
    ),
  );
}

void _initData() {
  // Auth DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: serviceLocator<ApiClient>().dio),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );

  // Tournament DataSource
  serviceLocator.registerLazySingleton<TournamentRemoteDataSource>(
    () => TournamentRemoteDataSourceImpl(dio: serviceLocator<ApiClient>().dio),
  );
  serviceLocator.registerLazySingleton<TournamentRepository>(
    () => TournamentRepositoryImpl(dataSource: serviceLocator()),
  );

  // Team DataSource
  serviceLocator.registerLazySingleton<TeamRemoteDataSource>(
    () => TeamRemoteDataSourceImpl(dio: serviceLocator<ApiClient>().dio),
  );
  serviceLocator.registerLazySingleton<TeamRepository>(
    () => TeamRepositoryImpl(dataSource: serviceLocator()),
  );

  // User DataSource
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: serviceLocator<ApiClient>().dio),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dataSource: serviceLocator()),
  );

  // Notification DataSource
  serviceLocator.registerLazySingleton<NotificationRemoteDataSource>(
    () =>
        NotificationRemoteDataSourceImpl(dio: serviceLocator<ApiClient>().dio),
  );
  serviceLocator.registerLazySingleton<NotificationRepository>(
    () => NotificationRepositoryImpl(dataSource: serviceLocator()),
  );
}

void _initDomain() {
  // Auth UseCases
  serviceLocator.registerFactory(() => LoginUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => RegisterUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => LogoutUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => IsLoggedInUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => GetUserRoleUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => GetUserIdUseCase(serviceLocator()));

  // Tournament UseCases
  serviceLocator.registerFactory(
    () => FetchTournamentsUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => FetchTournamentByIdUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => FetchUserTournamentsUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => CreateTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UpdateTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => DeleteTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => CancelTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => JoinTournamentUsecase(serviceLocator()));
  serviceLocator.registerFactory(
    () => StartTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => FinishTournamentUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UpdateMatchScoreUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => DisqualifyParticipantUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetAdminStatsUsecase(serviceLocator()));

  // Team UseCases
  serviceLocator.registerFactory(() => FetchUserTeamsUsecase(serviceLocator()));
  serviceLocator.registerFactory(
    () => FetchTeamDetailsUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => SearchTeamsUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => CreateTeamUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => UpdateTeamUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => DeleteTeamUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => JoinTeamUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => LeaveTeamUseCase(serviceLocator()));
  serviceLocator.registerFactory(
    () => GetJoinRequestsUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AcceptJoinRequestUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => RejectJoinRequestUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => UploadTeamLogoUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => KickTeammateUseCase(serviceLocator()));
  serviceLocator.registerFactory(
    () => PromoteTeammateUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => BanTeamUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => InviteUserUseCase(serviceLocator()));
  serviceLocator.registerFactory(
    () => SendJoinRequestUseCase(serviceLocator()),
  );

  // User UseCases
  serviceLocator.registerFactory(
    () => FetchUserProfileUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UpdateUserProfileUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => ChangePasswordUseCase(serviceLocator()));
  serviceLocator.registerFactory(
    () => UploadUserAvatarUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => SearchUsersUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => BanUserUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => UnbanUserUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => ChangeUserRoleUseCase(serviceLocator()));

  // Notification UseCases
  serviceLocator.registerFactory(
    () => FetchNotificationsUsecase(serviceLocator()),
  );
  serviceLocator.registerFactory(() => AcceptInviteUsecase(serviceLocator()));
  serviceLocator.registerFactory(() => DeclineInviteUseCase(serviceLocator()));
}

void _initPresentation() {
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      isLoggedIn: serviceLocator(),
      login: serviceLocator(),
      register: serviceLocator(),
      logout: serviceLocator(),
      getRole: serviceLocator(),
      getUserId: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => LoginBloc(loginUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => RegisterBloc(registerUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => CreateTeamBloc(
      createTeam: serviceLocator(),
      updateTeam: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => InvitePlayerBloc(
      searchUsers: serviceLocator(),
      inviteUser: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => AdminDashboardBloc(
      getTournaments: serviceLocator(),
      getAdminStats: serviceLocator(),
      cancelTournament: serviceLocator(),
      deleteTournament: serviceLocator(),
      searchTeams: serviceLocator(),
      deleteTeam: serviceLocator(),
      banTeam: serviceLocator(),
      searchUsers: serviceLocator(),
      banUser: serviceLocator(),
      unbanUser: serviceLocator(),
      changeUserRole: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CreateTournamentBloc(
      createTournament: serviceLocator(),
      updateTournament: serviceLocator(),
      cancelTournament: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ManagerDashboardBloc(getOrganizedTournaments: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => NotificationBloc(
      getNotifications: serviceLocator(),
      acceptInvite: serviceLocator(),
      declineInvite: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ProfileBloc(
      getUserId: serviceLocator(),
      getUserProfile: serviceLocator(),
      updateUserProfile: serviceLocator(),
      changePassword: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => TeamDetailBloc(
      getTeamDetails: serviceLocator(),
      getJoinRequests: serviceLocator(),
      acceptRequest: serviceLocator(),
      rejectRequest: serviceLocator(),
      promoteTeammate: serviceLocator(),
      kickTeammate: serviceLocator(),
      leaveTeam: serviceLocator(),
      deleteTeam: serviceLocator(),
      getUserId: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => TournamentDetailBloc(
      getTournament: serviceLocator(),
      joinTournament: serviceLocator(),
      startTournament: serviceLocator(),
      finishTournament: serviceLocator(),
      updateMatchScore: serviceLocator(),
      disqualifyParticipant: serviceLocator(),
      getUserId: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => TournamentsFeedBloc(getTournaments: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => UserTeamsBloc(
      getUserTeams: serviceLocator(),
      searchTeams: serviceLocator(),
      sendJoinRequest: serviceLocator(),
      getUserId: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserTournamentsBloc(
      getUserTournaments: serviceLocator(),
      getUserId: serviceLocator(),
    ),
  );
}
