import 'package:cyberclub_tournaments/core/routing/app_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_theme.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/notification_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  final AuthRepository authRepository;
  final TournamentRepository tournamentRepository;
  final TeamRepository teamRepository;
  final UserRepository userRepository;
  final NotificationRepository notificationRepository;

  const MainApp({
    super.key,
    required this.authRepository,
    required this.tournamentRepository,
    required this.teamRepository,
    required this.userRepository,
    required this.notificationRepository,
  });

  @override
  Widget build(BuildContext context) {
    // Внедрение репозиториев
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: tournamentRepository),
        RepositoryProvider.value(value: teamRepository),
        RepositoryProvider.value(value: userRepository),
        RepositoryProvider.value(value: notificationRepository),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,

        // Локализации
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // Языки
        supportedLocales: [const Locale('ru', 'RU')],

        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),
      ),
    );
  }
}
