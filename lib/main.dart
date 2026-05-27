import 'package:cyberclub_tournaments/app.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_event.dart';
import 'package:cyberclub_tournaments/core/bloc/bloc_observer.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  debugPrint("MAIN: App started");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);

  Bloc.observer = SimpleBlocObserver();

  await initDependencies();

  debugPrint("MAIN: Dependencies initialized");

  final authBloc = serviceLocator<AuthBloc>();
  authBloc.add(AuthCheckRequested());
  debugPrint("MAIN: AuthCheckRequested added");

  runApp(const MainApp());
}
