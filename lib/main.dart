import 'package:cyberclub_tournaments/app.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_event.dart';
import 'package:cyberclub_tournaments/core/bloc/bloc_observer.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting('ru_RU', null);

  // await initDependencies();

  // print('MAIN: Запуск проверки авторизации');
  // serviceLocator<AuthBloc>().add(AuthCheckRequested());

  // runApp(const MainApp());

  print("MAIN: App started");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);

  // 1. Подключаем Observer
  Bloc.observer = SimpleBlocObserver();

  await initDependencies();

  print("MAIN: Dependencies initialized");

  final authBloc = serviceLocator<AuthBloc>();
  authBloc.add(AuthCheckRequested());
  print("MAIN: AuthCheckRequested added");

  runApp(const MainApp());
}

// import 'package:cyberclub_tournaments/app.dart';
// import 'package:cyberclub_tournaments/data/providers/api_client.dart';
// import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
// import 'package:cyberclub_tournaments/data/repositories/notification_repository.dart';
// import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
// import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
// import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
// import 'package:cyberclub_tournaments/data/services/token_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';

// Future<void> main() async {
//   // Инициализация приложения
//   WidgetsFlutterBinding.ensureInitialized();
//   // Инициализация локализации и форматирования даты
//   await initializeDateFormatting('ru_RU', null);

//   // Инициализация слоев данных
//   final tokenStorage = TokenStorage();
//   final apiClient = ApiClient(tokenStorage: tokenStorage);

//   // Инициализация репозиториев
//   final authRepository = AuthRepository(
//     apiClient: apiClient,
//     tokenStorage: tokenStorage,
//   );
//   final tournamentRepository = TournamentRepository(apiClient: apiClient);
//   final teamRepository = TeamRepository(apiClient: apiClient);
//   final userRepository = UserRepository(apiClient: apiClient);
//   final notificationRepository = NotificationRepository(apiClient: apiClient);

//   // Запуск приложения
//   runApp(
//     MainApp(
//       authRepository: authRepository,
//       tournamentRepository: tournamentRepository,
//       teamRepository: teamRepository,
//       userRepository: userRepository,
//       notificationRepository: notificationRepository,
//     ),
//   );
// }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   await initDependencies();

// //   runApp(MainApp());
// // }
