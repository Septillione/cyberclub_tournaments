import 'package:cyberclub_tournaments/app.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/teams_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/tournament_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/user_tournaments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final tournamentsRepository = TournamentRepository();
final teamRepository = TeamRepository();

final goRouter = GoRouter(
  initialLocation: '/tournaments',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
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
                final tournament = tournamentsRepository.findTournamentById(
                  tournamentId,
                );

                if (tournament != null) {
                  return TournamentDetailScreen(tournament: tournament);
                } else {
                  return const Text('Турнир не найден');
                }
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
                  create: (context) =>
                      TeamDetailBloc(teamRepository: teamRepository)
                        ..add(TeamDetailStarted(teamId: teamId)),
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
              NoTransitionPage(child: ProfileScreen()),
        ),
      ],
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainNavigation(child: child);
      },
    ),
  ],
);
