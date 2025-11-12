import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/bloc/user_tournaments_bloc.dart';
import 'package:cyberclub_tournaments/core/routing/custom_bottom_nav_bar.dart';
import 'package:cyberclub_tournaments/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatelessWidget {
  final Widget child;

  const MainNavigation({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/tournaments')) {
      return 0;
    }
    if (location.startsWith('/my-tournaments')) {
      return 1;
    }
    if (location.startsWith('/my-teams')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/tournaments');
        break;
      case 1:
        context.go('/my-tournaments');
        break;
      case 2:
        context.go('/my-teams');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TournamentsFeedBloc(tournamentRepository: tournamentsRepository)
                ..add(TournamentsFeedStarted()),
        ),
        BlocProvider(
          create: (context) =>
              UserTournamentsBloc(tournamentRepository: tournamentsRepository)
                ..add(UserTournamentsStarted()),
        ),
        BlocProvider(
          create: (context) =>
              UserTeamsBloc(teamRepository: teamRepository)
                ..add(UserTeamsStarted()),
        ),
      ],
      child: Scaffold(
        body: child,
        bottomNavigationBar: GoogleNavBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (index) => _onItemTapped(context, index),
        ),
      ),
    );
  }
}
