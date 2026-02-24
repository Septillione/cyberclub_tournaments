import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/network/api_client.dart';
import 'package:cyberclub_tournaments/core/routing/app_router.dart';
import 'package:cyberclub_tournaments/datanew/datasources/auth_local_datasource.dart';
import 'package:cyberclub_tournaments/datanew/datasources/auth_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/datasources/notification_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/datasources/team_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/datasources/tournament_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/datasources/user_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/repositories/auth_repository_impl.dart';
import 'package:cyberclub_tournaments/datanew/repositories/notification_repository_impl.dart';
import 'package:cyberclub_tournaments/datanew/repositories/team_repository_impl.dart';
import 'package:cyberclub_tournaments/datanew/repositories/tournament_repository_impl.dart';
import 'package:cyberclub_tournaments/datanew/repositories/user_repository_impl.dart';
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
import 'package:cyberclub_tournaments/domain/usecases/tournament/update_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/ban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_password_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_user_role_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/fetch_user_profile_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/unban_user_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/update_user_profile_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/upload_user_avatar_usecase.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/login/bloc/login_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  _initData();
  _initDomain();
  _initPresentation();
}

void _initCore() {
  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  serviceLocator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      localDataSource: serviceLocator(),
      onBanned: (message) {
        AppRouter.router.go('/ban', extra: message);
      },
      onUnauthorized: () {
        AppRouter.router.go('/login');
      },
    ),
  );
}

void _initData() {
  // Auth DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );

  // Tournament DataSource
  serviceLocator.registerLazySingleton<TournamentRemoteDataSource>(
    () => TournamentRemoteDataSourceImpl(dio: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<TournamentRepository>(
    () => TournamentRepositoryImpl(dataSource: serviceLocator()),
  );

  // Team DataSource
  serviceLocator.registerLazySingleton<TeamRemoteDataSource>(
    () => TeamRemoteDataSourceImpl(dio: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<TeamRepository>(
    () => TeamRepositoryImpl(dataSource: serviceLocator()),
  );

  // User DataSource
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dataSource: serviceLocator()),
  );

  // Notification DataSource
  serviceLocator.registerLazySingleton<NotificationRemoteDataSource>(
    () => NotificationRemoteDataSourceImpl(dio: serviceLocator()),
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
    () => UpdateTournamentUsecase(serviceLocator()),
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
  serviceLocator.registerFactory(() => SearchUsersUsecase(serviceLocator()));
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
  serviceLocator.registerFactory(() => GetUserProfileUseCase(serviceLocator()));
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
}
