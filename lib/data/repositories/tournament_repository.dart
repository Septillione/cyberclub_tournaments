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

  // Future<List<String>> fetchDisciplines() async {
  //   return _disciplineFilterChips;
  // }

  // Future<List<TournamentModel>> fetchUserTournaments(String userId) async {
  //   return [
  //     mockTournaments.firstWhere((t) => t.id == 't-dota-1'),
  //     mockTournaments.firstWhere((t) => t.id == 't-cs-1'),
  //     mockTournaments.firstWhere((t) => t.id == 't-valorant-1'),
  //     mockTournaments.firstWhere((t) => t.id == 't-mortalkombat-1'),
  //   ];
  // }

  // TournamentModel? findTournamentById(String id) {
  //   try {
  //     return mockTournaments.firstWhere((t) => t.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
