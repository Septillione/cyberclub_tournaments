import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class TournamentRepository {
  final ApiClient _apiClient;

  TournamentRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final List<String> _disciplineFilterChips = [
    'Все игры',
    'Dota 2',
    'CS 2',
    'Valorant',
    'League of Legends',
    'Fortnite',
    'Call of Duty: Warzone',
    'Мир танков',
    'PUBG',
    'Apex Legends',
    'Warface',
    'FIFA',
    'Overwatch 2',
    'Clash Royale',
    'Brawl Stars',
    'StarCraft II',
    'Mortal Kombat',
    'Тетрис',
  ];

  final List<TournamentModel> mockTournaments = [
    TournamentModel(
      id: 't-dota-1',
      title: 'Dota 2 Champions League: Season 18',
      imageUrl:
          'https://cs11.pikabu.ru/post_img/2019/04/29/5/og_og_1556521295259832113.jpg',
      discipline: 'Dota 2',
      startDate: DateTime.now().add(const Duration(days: 7)),
      status: TournamentStatus.registrationOpened,
      prizePool: 50000,
      registeredPlayerIds: ['p0', 'p1', 'p2', 'p3', 'p4'],
      type: 'Онлайн',
      format: 'Single Elimination',
      formatVersus: '5v5',
      description:
          'Легендарный турнир возвращается! Собери команду и докажи свое превосходство на полях Древних.',
      rules:
          '1. Уважение к соперникам.\n2. Никаких читов.\n3. Матчи до 2 побед.',
      address: null,
      participants: TournamentParticipants(
        currentParticipants: 16,
        maxParticipants: 32,
      ),
      prizes: TournamentPrizes(
        firstPlace: '30000 + Уникальный скин Пуджа',
        secondPlace: '15000',
        thirdPlace: '5000',
      ),
    ),
    TournamentModel(
      id: 't-cs-1',
      title: 'CS 2 Masters Cup',
      imageUrl:
          'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1HH29y.img?w=2200&h=1100&m=4&q=79',
      discipline: 'CS 2',
      startDate: DateTime.now().add(const Duration(hours: 2)),
      status: TournamentStatus.live,
      prizePool: 100000,
      registeredPlayerIds: ['p0', 'p1', 'p5', 'b0', 'b1'],
      type: 'Офлайн (LAN)',
      format: 'Double Elimination',
      formatVersus: '5v5',
      description:
          'Финальная битва сильнейших команд города. Приходите поддержать!',
      rules: 'Все стандартные правила ESL.',
      address: 'г. Москва, ул. Киберспортивная, д. 1',
      participants: TournamentParticipants(
        currentParticipants: 8,
        maxParticipants: 8,
      ),
      prizes: TournamentPrizes(
        firstPlace: '60000',
        secondPlace: '30000',
        thirdPlace: '10000',
      ),
    ),
    TournamentModel(
      id: 't-valorant-1',
      title: 'Valorant Rising Stars',
      imageUrl:
          'https://avatars.mds.yandex.net/i?id=8d69330865cffb4f83e497a2f07381d1_l-5347442-images-thumbs&n=13',
      discipline: 'Valorant',
      startDate: DateTime.now().subtract(const Duration(days: 5)),
      prizePool: 45000,
      status: TournamentStatus.finished,
      registeredPlayerIds: ['b0', 'b1', 'b2', 'b3', 'b4'],
      type: 'Офлайн (LAN)',
      format: 'Single Elimination',
      formatVersus: '5v5',
      description:
          'Легендарный турнир возвращается! Собери команду и докажи свое превосходство.',
      rules: 'Все стандартные правила ESL.',
      address: null,
      participants: TournamentParticipants(
        currentParticipants: 28,
        maxParticipants: 28,
      ),
      prizes: TournamentPrizes(firstPlace: '30000', secondPlace: '15000'),
    ),
    TournamentModel(
      id: 't-mortalkombat-1',
      title: 'Mortal Kombat Tournament',
      imageUrl:
          'https://files.vgtimes.ru/gallery/thumb/185635/2005281888_default.webp',
      discipline: 'Mortal Kombat 1',
      startDate: DateTime.now().add(const Duration(days: 11)),
      prizePool: 80000,
      status: TournamentStatus.registrationClosed,
      type: 'Офлайн (LAN)',
      format: 'Double Elimination',
      formatVersus: '1v1',
      description: 'Легендарный турнир возвращается! Приходите поддержать!',
      rules: 'Все стандартные правила ESL.',
      address: null,
      participants: TournamentParticipants(
        currentParticipants: 14,
        maxParticipants: 32,
      ),
      prizes: TournamentPrizes(
        firstPlace: '50000',
        secondPlace: '20000',
        thirdPlace: '10000',
      ),
    ),
  ];

  Future<List<TournamentModel>> fetchTournaments() async {
    try {
      final response = await _apiClient.dio.get('/tournaments');

      final List<dynamic> dataList = response.data['items'];

      final tournaments = dataList.map((json) {
        return TournamentModel.fromJson(json);
      }).toList();

      print('УСПЕХ: Загружено ${tournaments.length} турниров с сервера!');
      return tournaments;
    } catch (e) {
      print('ОШИБКА СЕТИ: $e');
      print('Возвращаем моковые данные...');

      return mockTournaments;
    }
  }

  Future<List<String>> fetchDisciplines() async {
    return _disciplineFilterChips;
  }

  Future<List<TournamentModel>> fetchUserTournaments(String userId) async {
    return [
      mockTournaments.firstWhere((t) => t.id == 't-dota-1'),
      mockTournaments.firstWhere((t) => t.id == 't-cs-1'),
      mockTournaments.firstWhere((t) => t.id == 't-valorant-1'),
      mockTournaments.firstWhere((t) => t.id == 't-mortalkombat-1'),
    ];
  }

  TournamentModel? findTournamentById(String id) {
    try {
      return mockTournaments.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }
}
