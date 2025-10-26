import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/tournaments_feed_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/user_teams_screen.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/user_tournaments_screen.dart';
import 'package:cyberclub_tournaments/core/utils/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    TournamentsFeedScreen(),
    UserTournamentsScreen(),
    UserTeamsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: GoogleNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
