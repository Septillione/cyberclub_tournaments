import 'package:cyberclub_tournaments/core/routing/main_navigation.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/BanScreen/ban_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/LoginScreen/login_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/RegisterScreen/register_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/splash_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/CreateTeamScreen/create_team_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/admin_dashboard_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/CreateTournamentScreen/create_tournament_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/ManagerDashboardScreen/manager_dashboard_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/NotificationsScreen/notification_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/widgets/change_password_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/widgets/edit_profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/widgets/public_profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamSearchScreen/team_search_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/teams_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/invite_player_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/bloc/tournament_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/tournament_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/user_tournaments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // Приватные ключи навигации
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      GoRoute(
        path: '/ban',
        builder: (context, state) {
          // Получаем сообщение из extra, которое передал ApiClient
          final message = state.extra as String? ?? '';
          return BanScreen(banMessage: message);
        },
      ),

      GoRoute(
        path: '/create-team',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const CreateTeamScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/edit-team',
        pageBuilder: (context, state) {
          final teamToEdit = state.extra as TeamModel;
          return CustomTransitionPage(
            child: CreateTeamScreen(teamToEdit: teamToEdit),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        path: '/find-user',
        pageBuilder: (context, state) {
          final teamId = state.extra as String;
          return CustomTransitionPage(
            child: InvitePlayerScreen(teamId: teamId),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/change-password',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ChangePasswordScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),

      GoRoute(
        path: '/find-team',
        builder: (context, state) => const TeamSearchScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/manager-dashboard',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ManagerDashboardScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/admin-dashboard',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const AdminDashboardScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/create-tournament',
        pageBuilder: (context, state) {
          final tournament = state.extra as TournamentModel?;

          return CustomTransitionPage(
            child: CreateTournamentScreen(tournamentToEdit: tournament),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      GoRoute(
        path: '/notifications',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const NotificationScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            key: state.pageKey,
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainNavigation(child: child);
        },
        routes: [
          // Лента турниров
          GoRoute(
            path: '/tournaments',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TournamentsFeedScreen()),
            routes: [
              GoRoute(
                path: ':tournamentId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final tournamentId = state.pathParameters['tournamentId']!;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: BlocProvider(
                      create: (context) =>
                          TournamentDetailBloc(
                            tournamentRepository: context
                                .read<TournamentRepository>(),
                            authRepository: context.read<AuthRepository>(),
                          )..add(
                            TournamentDetailStarted(tournamentId: tournamentId),
                          ),
                      child: TournamentDetailScreen(tournamentId: tournamentId),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutCubic;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                  );
                },
              ),
            ],
          ),

          // Мои турниры
          GoRoute(
            path: '/my-tournaments',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserTournamentsScreen()),
          ),

          // Мои команды
          GoRoute(
            path: '/my-teams',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserTeamsScreen()),
            routes: [
              GoRoute(
                path: ':teamId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final teamId = state.pathParameters['teamId']!;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: BlocProvider(
                      create: (context) => TeamDetailBloc(
                        teamRepository: context.read<TeamRepository>(),
                        authRepository: context.read<AuthRepository>(),
                      )..add(TeamDetailStarted(teamId: teamId)),
                      child: const TeamsDetailScreen(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutCubic;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                  );
                },
              ),
            ],
          ),

          // Профиль
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
            routes: [
              GoRoute(
                path: 'edit',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  // final userProfile = state.extra as UserProfileModel;

                  final extras = state.extra as Map<String, dynamic>;
                  final userProfile = extras['user'] as UserProfileModel;
                  final profileBloc = extras['bloc'] as ProfileBloc;

                  return CustomTransitionPage(
                    child: BlocProvider.value(
                      value: profileBloc,
                      child: EditProfileScreen(userProfile: userProfile),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutCubic;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: ':userId',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  final userId = state.pathParameters['userId']!;
                  return CustomTransitionPage(
                    child: PublicProfileScreen(userId: userId),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutCubic;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                    key: state.pageKey,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
