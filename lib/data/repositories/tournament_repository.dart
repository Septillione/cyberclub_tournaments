import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class TournamentRepository {
  final ApiClient _apiClient;

  TournamentRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<TournamentModel>> fetchTournaments({
    TournamentFilter? filter,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};

      if (filter != null) {
        if (filter.discipline != null) {
          queryParams['discipline'] = filter.discipline!.name;
        }
        if (filter.status != null) queryParams['status'] = filter.status!.name;
        if (filter.teamMode != null) {
          queryParams['teamMode'] = filter.teamMode!.toJson();
        }
        if (filter.isOnline != null) {
          queryParams['isOnline'] = filter.isOnline.toString();
        }
        if (filter.sortOrder != null) {
          queryParams['sortOrder'] = filter.sortOrder!.name;
        }
        if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
          queryParams['search'] = filter.searchQuery;
        }
      }

      final response = await _apiClient.dio.get(
        '/tournaments',
        queryParameters: queryParams,
      );

      final List<dynamic> dataList = response.data['items'];

      final tournaments = dataList.map((json) {
        return TournamentModel.fromJson(json);
      }).toList();

      print('УСПЕХ: Загружено ${tournaments.length} турниров с сервера!');
      return tournaments;
    } catch (e) {
      print('ОШИБКА СЕТИ: $e');
      throw ErrorHandler.handle(e);
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
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<TournamentModel>> fetchUserTournaments() async {
    try {
      final response = await _apiClient.dio.get('/tournaments/my');
      final List<dynamic> dataList = response.data;

      return dataList.map((json) => TournamentModel.fromJson(json)).toList();
    } catch (e) {
      print('Ошибка загрузки турниров пользователя');
      throw ErrorHandler.handle(e);
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
    try {
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
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
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
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> joinTournament(String tournamentId, {String? teamId}) async {
    try {
      await _apiClient.dio.post(
        '/tournaments/$tournamentId/join',
        data: {if (teamId != null) 'teamId': teamId},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> startTournament(String tournamentId) async {
    try {
      await _apiClient.dio.post('/tournaments/$tournamentId/start');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> updateMatchScore(String matchId, int score1, int score2) async {
    try {
      await _apiClient.dio.post(
        '/tournaments/matches/$matchId',
        data: {'score1': score1, 'score2': score2},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> finishTournament(String tournamentId) async {
    try {
      await _apiClient.dio.post('/tournaments/$tournamentId/finish');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<Map<String, dynamic>> getAdminStats() async {
    try {
      final response = await _apiClient.dio.get('/tournaments/statistics');

      print(response.data);
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw ErrorHandler.handle(e);
      // print('Ошибка $e');

      // return {
      //   'tournaments': {'total': 0, 'live': 0, 'open': 0},
      //   'users': {'total': 0, 'inTeams': 0},
      //   'teams': {'total': 0, 'active': 0},
      // };
    }
  }

  Future<void> deleteTournament(String tournamentId) async {
    try {
      await _apiClient.dio.delete('/tournaments/$tournamentId');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> cancelTournament(String tournamentId) async {
    try {
      await _apiClient.dio.patch('/tournaments/$tournamentId/cancel');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> updateTournament(
    String tournamentId,
    String title,
    String description,
    String rules,
    Discipline discipline,
    DateTime startDate,
    int maxParticipants,
    BracketType bracketType,
    TeamMode teamMode,
    bool isOnline,
    String? address,
    String? imageUrl,
    List<PrizeItem>? prizes,
  ) async {
    try {
      final data = <String, dynamic>{};
      data['title'] = title;
      data['description'] = description;
      data['rules'] = rules;
      data['discipline'] = discipline.name;
      data['startDate'] = startDate.toIso8601String();
      data['maxParticipants'] = maxParticipants;
      data['bracketType'] = bracketType.name;
      data['teamMode'] = teamMode.toJson();
      data['isOnline'] = isOnline;
      if (address != null) data['address'] = address;
      if (imageUrl != null) data['imageUrl'] = imageUrl;
      if (prizes != null) {
        data['prizes'] = prizes.map((prize) => prize.toJson()).toList();
      }
      await _apiClient.dio.patch('/tournaments/$tournamentId', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> disqualifyParticipant(String matchId, int loserPosition) async {
    try {
      await _apiClient.dio.patch(
        '/tournaments/matches/$matchId/disqualify',
        data: {'loserPosition': loserPosition},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
