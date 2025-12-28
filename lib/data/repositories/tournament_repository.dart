import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class TournamentRepository {
  final ApiClient _apiClient;

  TournamentRepository({required ApiClient apiClient}) : _apiClient = apiClient;

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
      return [];
    }
  }

  Future<TournamentModel?> fetchTournamentById(String id) async {
    try {
      final response = await _apiClient.dio.get('/tournaments/$id');
      final tournament = TournamentModel.fromJson(response.data);

      print('УСПЕХ: Загружен турнир с сервера!');
      return tournament;
    } catch (e) {
      print('ОШИБКА СЕТИ: $e');
      return null;
    }
  }

  Future<List<TournamentModel>> fetchUserTournaments() async {
    try {
      final response = await _apiClient.dio.get('/tournaments/my');
      final List<dynamic> dataList = response.data;

      return dataList.map((json) => TournamentModel.fromJson(json)).toList();
    } catch (e) {
      print('Ошибка загрузки турниров пользователя');
      return [];
    }
  }

  List<Discipline> getDisciplines() {
    return Discipline.values;
  }

  Future<void> createTournament({
    required String title,
    required String description,
    required String rules,
    required Discipline discipline,
    required DateTime startDate,
    required int maxParticipants,
    required BracketType bracketType,
    required TeamMode teamMode,
    required bool isOnline,
    String? address,
    String? imageUrl,
    List<PrizeItem>? prizes,
  }) async {
    await _apiClient.dio.post(
      '/tournaments',
      data: {
        'title': title,
        'description': description,
        'rules': rules,
        'discipline': discipline.name,
        'startDate': startDate.toIso8601String(),
        'maxParticipants': maxParticipants,
        'bracketType': bracketType.name,
        'teamMode': teamMode.toJson(),
        'isOnline': isOnline,
        'address': address,
        'imageUrl': imageUrl ?? 'https://placehold.co/600x400',
        'prizes': prizes!.map((p) => p.toJson()).toList(),
      },
    );
  }

  Future<List<TournamentModel>> fetchTournamentsForManagerDashboard() async {
    try {
      final response = await _apiClient.dio.get('/tournaments/organized');

      final List<dynamic> dataList = response.data;

      final tournaments = dataList
          .map((t) => TournamentModel.fromJson(t))
          .toList();

      return tournaments;
    } catch (e) {
      print('Ошибка $e');
      return [];
    }
  }

  Future<void> joinTournament(String tournamentId, {String? teamId}) async {
    await _apiClient.dio.post(
      '/tournaments/$tournamentId/join',
      data: {if (teamId != null) 'teamId': teamId},
    );
  }

  Future<void> startTournament(String tournamentId) async {
    await _apiClient.dio.post('/tournaments/$tournamentId/start');
  }

  Future<void> updateMatchScore(String matchId, int score1, int score2) async {
    await _apiClient.dio.post(
      '/tournaments/matches/$matchId',
      data: {'score1': score1, 'score2': score2},
    );
  }
}
