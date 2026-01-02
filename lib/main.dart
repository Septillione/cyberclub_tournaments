import 'package:cyberclub_tournaments/app.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/notification_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:cyberclub_tournaments/data/services/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  // Инициализация приложения
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализация локализации и форматирования даты
  await initializeDateFormatting('ru_RU', null);

  // Инициализация слоев данных
  final tokenStorage = TokenStorage();
  final apiClient = ApiClient(tokenStorage: tokenStorage);

  // Инициализация репозиториев
  final authRepository = AuthRepository(
    apiClient: apiClient,
    tokenStorage: tokenStorage,
  );
  final tournamentRepository = TournamentRepository(apiClient: apiClient);
  final teamRepository = TeamRepository(apiClient: apiClient);
  final userRepository = UserRepository(apiClient: apiClient);
  final notificationRepository = NotificationRepository(apiClient: apiClient);

  // Запуск приложения
  runApp(
    MainApp(
      authRepository: authRepository,
      tournamentRepository: tournamentRepository,
      teamRepository: teamRepository,
      userRepository: userRepository,
      notificationRepository: notificationRepository,
    ),
  );
}
