import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/datanew/models/tournament/tournament_model.dart';
import 'package:dio/dio.dart';

abstract class TournamentRemoteDataSource {
  Future<List<TournamentModel>> fetchTournaments(Map<String, dynamic> params);
  Future<TournamentModel?> fetchTournamentById(String id);
  Future<List<TournamentModel>> fetchUserTournaments();
  // Future<List<TournamentModel>> fetchOrganizedTournaments();
  Future<void> createTournament(Map<String, dynamic> data);
  Future<void> updateTournament(String id, Map<String, dynamic> data);
  Future<void> deleteTournament(String id);
  Future<void> cancelTournament(String id);
  Future<void> joinTournament(String tournamentId, {String? teamId});
  Future<void> startTournament(String tournamentId);
  Future<void> finishTournament(String tournamentId);
  Future<void> updateMatchScore(String matchId, int score1, int score2);
  Future<void> disqualifyParticipant(String matchId, int loserPosition);
  Future<Map<String, dynamic>> getAdminStats();
}

class TournamentRemoteDataSourceImpl implements TournamentRemoteDataSource {
  final Dio _dio;

  TournamentRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<TournamentModel>> fetchTournaments(
    Map<String, dynamic> params,
  ) async {
    try {
      final response = await _dio.get('/tournaments', queryParameters: params);
      final List<dynamic> dataList = response.data['items'];
      return dataList.map((json) => TournamentModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<TournamentModel?> fetchTournamentById(String id) async {
    try {
      final response = await _dio.get('/tournaments/$id');
      return TournamentModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<List<TournamentModel>> fetchUserTournaments() async {
    try {
      final response = await _dio.get('/tournaments/my');
      final List<dynamic> dataList = response.data;
      return dataList.map((json) => TournamentModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  // @override
  // Future<List<TournamentModel>> fetchOrganizedTournaments() async {
  //   try {
  //     final response = await _dio.get('/tournaments/organized');
  //     final List<dynamic> dataList = response.data;
  //     return dataList.map((json) => TournamentModel.fromJson(json)).toList();
  //   } catch (e) {
  //     throw ErrorHandler.handle(e);
  //   }
  // }

  @override
  Future<void> createTournament(Map<String, dynamic> data) async {
    try {
      await _dio.post('/tournaments', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> updateTournament(String id, Map<String, dynamic> data) async {
    try {
      await _dio.patch('/tournaments/$id', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> deleteTournament(String id) async {
    try {
      await _dio.delete('/tournaments/$id');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> cancelTournament(String id) async {
    try {
      await _dio.patch('/tournaments/$id/cancel');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> joinTournament(String tournamentId, {String? teamId}) async {
    try {
      await _dio.post(
        '/tournaments/$tournamentId/join',
        data: {if (teamId != null) 'teamId': teamId},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> startTournament(String tournamentId) async {
    try {
      await _dio.post('/tournaments/$tournamentId/start');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> finishTournament(String tournamentId) async {
    try {
      await _dio.post('/tournaments/$tournamentId/finish');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> updateMatchScore(String matchId, int score1, int score2) async {
    try {
      await _dio.post(
        '/tournaments/matches/$matchId',
        data: {'score1': score1, 'score2': score2},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> disqualifyParticipant(String matchId, int loserPosition) async {
    try {
      await _dio.patch(
        '/tournaments/matches/$matchId/disqualify',
        data: {'loserPosition': loserPosition},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getAdminStats() async {
    try {
      final response = await _dio.get('/tournaments/statistics');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
