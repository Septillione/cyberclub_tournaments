import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/routing/app_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(serviceLocator<AuthBloc>());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<AuthBloc>(),
      child: MaterialApp.router(
        routerConfig: _appRouter.router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru', 'RU')],
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),
      ),
    );
  }
}
