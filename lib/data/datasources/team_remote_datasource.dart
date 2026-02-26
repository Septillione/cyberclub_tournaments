import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/data/models/join_request/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/team/team_model.dart';
import 'package:dio/dio.dart';

abstract class TeamRemoteDataSource {
  Future<List<TeamModel>> fetchUserTeams();
  Future<TeamModel> fetchTeamDetails(String teamId);
  Future<List<TeamModel>> searchTeams(String? query);
  Future<List<TeamUserShortModel>> searchUsers(String query);
  Future<List<JoinRequestModel>> getJoinRequests(String teamId);
  Future<void> createTeam(Map<String, dynamic> data);
  Future<void> updateTeam(String teamId, Map<String, dynamic> data);
  Future<void> deleteTeam(String teamId);
  Future<void> joinTeam(String teamId);
  Future<void> leaveTeam(String teamId);
  Future<void> inviteUser(String teamId, String userId);
  Future<void> sendJoinRequest(String teamId);
  Future<void> acceptJoinRequest(String requestId);
  Future<void> rejectJoinRequest(String requestId);
  Future<void> promoteTeammate(String teamId, String userId);
  Future<void> kickTeammate(String teamId, String userId);
  Future<String?> uploadTeamLogo(String filePath);
  Future<void> banTeam(String teamId, bool isBanned);
}

class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  final Dio _dio;

  TeamRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<TeamModel>> fetchUserTeams() async {
    try {
      final response = await _dio.get('/teams/my');
      final List list = response.data;
      return list.map((json) => TeamModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<TeamModel> fetchTeamDetails(String teamId) async {
    try {
      final response = await _dio.get('/teams/$teamId');
      return TeamModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<List<TeamModel>> searchTeams(String? query) async {
    try {
      final response = await _dio.get(
        '/teams',
        queryParameters: query != null && query.isNotEmpty
            ? {'search': query}
            : null,
      );
      final List list = response.data;
      return list.map((json) => TeamModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<List<TeamUserShortModel>> searchUsers(String query) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {'search': query},
      );
      final List list = response.data;
      return list.map((json) => TeamUserShortModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<List<JoinRequestModel>> getJoinRequests(String teamId) async {
    try {
      final response = await _dio.get('/teams/$teamId/requests');
      final List list = response.data;
      return list.map((json) => JoinRequestModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> createTeam(Map<String, dynamic> data) async {
    try {
      await _dio.post('/teams', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> updateTeam(String teamId, Map<String, dynamic> data) async {
    try {
      await _dio.patch('/teams/$teamId', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> deleteTeam(String teamId) async {
    try {
      await _dio.post('/teams/$teamId/delete');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> joinTeam(String teamId) async {
    try {
      await _dio.post('/teams/$teamId/join');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> leaveTeam(String teamId) async {
    try {
      await _dio.post('/teams/$teamId/leave');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> inviteUser(String teamId, String userId) async {
    try {
      await _dio.post('/teams/$teamId/invite', data: {'userId': userId});
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> sendJoinRequest(String teamId) async {
    try {
      await _dio.post('/teams/$teamId/request');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> acceptJoinRequest(String requestId) async {
    try {
      await _dio.post('/teams/requests/$requestId/accept');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> rejectJoinRequest(String requestId) async {
    try {
      await _dio.post('/teams/requests/$requestId/reject');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> promoteTeammate(String teamId, String userId) async {
    try {
      await _dio.post('/teams/$teamId/promote', data: {'userId': userId});
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> kickTeammate(String teamId, String userId) async {
    try {
      await _dio.post('/teams/$teamId/kick', data: {'userId': userId});
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<String?> uploadTeamLogo(String filePath) async {
    try {
      final fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final response = await _dio.post('/uploads', data: formData);
      final String relativeUrl = response.data['url'];
      final baseUrl = _dio.options.baseUrl.replaceAll('/api/v1', '');

      return '$baseUrl$relativeUrl';
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> banTeam(String teamId, bool isBanned) async {
    try {
      await _dio.patch(
        '/admin/teams/$teamId/ban',
        data: {'isBanned': isBanned},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
