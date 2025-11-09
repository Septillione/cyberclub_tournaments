import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/bloc/user_tournaments_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/user_tournaments_screen.dart';
import 'package:cyberclub_tournaments/core/routing/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => TournamentRepository(),
//       child: const MainNavigation(),
//       // child: Scaffold(
//       //   extendBody: true,
//       //   body: IndexedStack(index: _selectedIndex, children: _pages),
//       //   bottomNavigationBar: GoogleNavBar(
//       //     currentIndex: _selectedIndex,
//       //     onTap: _onItemTapped,
//       //   ),
//       // ),
//     );
//   }
// }

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
          create: (context) => TournamentsFeedBloc(
            tournamentRepository: context.read<TournamentRepository>(),
          )..add(TournamentsFeedStarted()),
        ),
        BlocProvider(
          create: (context) => UserTournamentsBloc(
            tournamentRepository: context.read<TournamentRepository>(),
          )..add(UserTournamentsStarted()),
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

// class MainNavigation extends StatefulWidget {
//   const MainNavigation({super.key});

//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }

// class _MainNavigationState extends State<MainNavigation> {
//   int _selectedIndex = 0;

//   static final List<Widget> _pages = <Widget>[
//     BlocProvider(
//       create: (context) => TournamentsFeedBloc(
//         tournamentRepository: context.read<TournamentRepository>(),
//       )..add(TournamentsFeedStarted()),
//       child: const TournamentsFeedScreen(),
//     ),
//     BlocProvider(
//       create: (context) => UserTournamentsBloc(
//         tournamentRepository: context.read<TournamentRepository>(),
//       )..add(UserTournamentsStarted()),
//       child: const UserTournamentsScreen(),
//     ),
//     const UserTeamsScreen(),
//     const ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: IndexedStack(index: _selectedIndex, children: _pages),
//       bottomNavigationBar: GoogleNavBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
