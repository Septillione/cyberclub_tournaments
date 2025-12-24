import 'package:cyberclub_tournaments/core/routing/main_navigation.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/LoginScreen/login_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/RegisterScreen/register_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/AuthScreens/splash_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/CreateTeamScreen/create_team_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/CreateTournamentScreen/create_tournament_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/ManagerDashboardScreen/manager_dashboard_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamSearchScreen/team_search_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/teams_detail_screen.dart';
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
        path: '/create-team',
        builder: (context, state) => const CreateTeamScreen(),
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
        builder: (context, state) => const ManagerDashboardScreen(),
      ),
      GoRoute(
        path: '/create-tournament',
        builder: (context, state) => const CreateTournamentScreen(),
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
                builder: (context, state) {
                  final tournamentId = state.pathParameters['tournamentId']!;
                  return BlocProvider(
                    create: (context) => TournamentDetailBloc(
                      tournamentRepository: context
                          .read<TournamentRepository>(),
                    )..add(TournamentDetailStarted(tournamentId: tournamentId)),
                    child: TournamentDetailScreen(tournamentId: tournamentId),
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
                builder: (context, state) {
                  final teamId = state.pathParameters['teamId']!;

                  return BlocProvider(
                    create: (context) => TeamDetailBloc(
                      teamRepository: context.read<TeamRepository>(),
                      authRepository: context.read<AuthRepository>(),
                    )..add(TeamDetailStarted(teamId: teamId)),
                    child: const TeamsDetailScreen(),
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
          ),
        ],
      ),
    ],
  );
}
