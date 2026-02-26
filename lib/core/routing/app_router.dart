import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_state.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/routing/go_router_refresh_stream.dart';
import 'package:cyberclub_tournaments/core/routing/main_navigation.dart';
import 'package:cyberclub_tournaments/core/routing/route_names.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/admin_dashboard_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/ban/ban_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/login/login_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/register/register_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/auth/splash/splash_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_team/create_team_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/create_tournament_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/invite_player/invite_player_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/manager_dashboard/manager_dashboard_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/notifications/notification_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/change_password_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/edit_profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/public_profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/team_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/tournament_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/user_tournaments_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),

    // redirect: (context, state) {
    //   final authState = authBloc.state;
    //   final location = state.matchedLocation;

    //   final isAuthRoute =
    //       location == RouteNames.login ||
    //       location == RouteNames.register ||
    //       location == RouteNames.splash;

    //   if (authState is AuthLoading || authState is AuthInitial) {
    //     return RouteNames.splash;
    //   }

    //   if (authState is AuthUnauthenticated) {
    //     return isAuthRoute ? null : RouteNames.login;
    //   }

    //   if (authState is AuthAuthenticated) {
    //     if (isAuthRoute) return RouteNames.tournaments;
    //   }

    //   return null;
    // },

    // redirect: (context, state) {
    //   final authState = authBloc.state;
    //   final location = state.matchedLocation;

    //   final isAuthRoute =
    //       location == RouteNames.login ||
    //       location == RouteNames.register ||
    //       location == RouteNames.splash;

    //   // Если загрузка — ничего не делаем, остаемся на splash (который initialLocation)
    //   if (authState is AuthInitial || authState is AuthLoading) {
    //     // Если мы уже на splash — null (не редиректим)
    //     if (location == RouteNames.splash) return null;
    //     return RouteNames.splash;
    //   }

    //   // Если не авторизован
    //   if (authState is AuthUnauthenticated) {
    //     // Если мы уже на логине/регистрации — не редиректим
    //     if (isAuthRoute) return null;
    //     return RouteNames.login;
    //   }

    //   // Если авторизован
    //   if (authState is AuthAuthenticated) {
    //     // Если пытаемся зайти на auth экраны — редирект в приложение
    //     if (isAuthRoute) {
    //       return RouteNames.tournaments;
    //     }
    //   }

    //   return null;
    // },
    redirect: (context, state) {
      final authState = authBloc.state;
      final location = state.matchedLocation;

      // 1. Если загрузка - идем на сплэш (если еще не там)
      if (authState is AuthInitial || authState is AuthLoading) {
        if (location != RouteNames.splash) return RouteNames.splash;
        return null;
      }

      // 2. Если не авторизован
      if (authState is AuthUnauthenticated) {
        // Если мы на сплэше - КИДАЕМ НА ЛОГИН
        if (location == RouteNames.splash) {
          return RouteNames.login;
        }

        // Если мы на логине или регистрации - остаемся
        if (location == RouteNames.login || location == RouteNames.register) {
          return null;
        }

        // Если пытались зайти внутрь - кидаем на логин
        return RouteNames.login;
      }

      // 3. Если авторизован
      if (authState is AuthAuthenticated) {
        // Если мы на сплэше, логине или регистрации - пускаем внутрь
        if (location == RouteNames.splash ||
            location == RouteNames.login ||
            location == RouteNames.register) {
          return RouteNames.tournaments;
        }
      }

      return null;
    },

    routes: [
      // Auth routes
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouteNames.ban,
        builder: (context, state) {
          final message = state.extra as String? ?? '';
          return BanScreen(banMessage: message);
        },
      ),

      // Standalone routes
      GoRoute(
        path: RouteNames.createTeam,
        pageBuilder: (context, state) =>
            _slideTransition(state: state, child: const CreateTeamScreen()),
      ),
      GoRoute(
        path: RouteNames.editTeam,
        pageBuilder: (context, state) {
          final team = state.extra as TeamEntity;
          return _slideTransition(
            state: state,
            child: CreateTeamScreen(teamToEdit: team),
          );
        },
      ),
      GoRoute(
        path: RouteNames.findUser,
        pageBuilder: (context, state) {
          final teamId = state.extra as String;
          return _slideTransition(
            state: state,
            child: InvitePlayerScreen(teamId: teamId),
          );
        },
      ),
      GoRoute(
        path: RouteNames.changePassword,
        pageBuilder: (context, state) =>
            _slideTransition(state: state, child: const ChangePasswordScreen()),
      ),
      GoRoute(
        path: RouteNames.notifications,
        pageBuilder: (context, state) =>
            _slideTransition(state: state, child: const NotificationScreen()),
      ),
      GoRoute(
        path: RouteNames.managerDashboard,
        pageBuilder: (context, state) => _slideTransition(
          state: state,
          child: const ManagerDashboardScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.adminDashboard,
        pageBuilder: (context, state) =>
            _slideTransition(state: state, child: const AdminDashboardScreen()),
      ),
      GoRoute(
        path: RouteNames.createTournament,
        pageBuilder: (context, state) {
          final tournament = state.extra as TournamentEntity?;
          return _slideTransition(
            state: state,
            child: CreateTournamentScreen(tournamentToEdit: tournament),
          );
        },
      ),

      // Shell route
      ShellRoute(
        builder: (context, state, child) => MainNavigation(child: child),
        routes: [
          GoRoute(
            path: RouteNames.tournaments,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TournamentsFeedScreen()),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return TournamentDetailScreen(tournamentId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: RouteNames.myTournaments,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserTournamentsScreen()),
          ),
          GoRoute(
            path: RouteNames.myTeams,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: UserTeamsScreen()),
            routes: [
              GoRoute(
                path: ':teamId',
                builder: (context, state) {
                  final teamId = state.pathParameters['teamId']!;
                  return TeamDetailScreen(teamId: teamId);
                },
              ),
            ],
          ),
          GoRoute(
            path: RouteNames.profile,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
            routes: [
              GoRoute(
                path: 'edit',
                pageBuilder: (context, state) {
                  final extras = state.extra as Map<String, dynamic>;
                  final userProfile = extras['user'] as UserEntity;
                  return _slideTransition(
                    state: state,
                    child: EditProfileScreen(userProfile: userProfile),
                  );
                },
              ),
              GoRoute(
                path: ':userId',
                pageBuilder: (context, state) {
                  final userId = state.pathParameters['userId']!;
                  return _slideTransition(
                    state: state,
                    child: PublicProfileScreen(userId: userId),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage _slideTransition({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}
