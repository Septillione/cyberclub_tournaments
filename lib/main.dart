import 'package:cyberclub_tournaments/core/routing/app_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_theme.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ru_RU', null);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TournamentRepository(apiClient: apiClient),
        ),
        RepositoryProvider(
          create: (context) => TeamRepository(apiClient: apiClient),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale('ru', 'RU')],

        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),
      ),
    );
  }
}
