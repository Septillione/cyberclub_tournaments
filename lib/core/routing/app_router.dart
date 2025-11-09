import 'package:cyberclub_tournaments/app.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/tournament_detail_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/user_tournaments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/tournaments',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      routes: [
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
                final tournament = context
                    .read<TournamentRepository>()
                    .findTournamentById(tournamentId);

                if (tournament != null) {
                  return TournamentDetailScreen(tournament: tournament);
                } else {
                  return const Text('Турнир не найден');
                }
              },
            ),
          ],
        ),
        GoRoute(
          path: '/my-tournaments',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UserTournamentsScreen()),
        ),
        GoRoute(
          path: '/my-teams',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: UserTeamsScreen()),
        ),
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
