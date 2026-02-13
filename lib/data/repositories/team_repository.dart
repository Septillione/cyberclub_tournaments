import 'package:cyberclub_tournaments/core/utils/error_handler.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:dio/dio.dart';

class TeamRepository {
  final ApiClient _apiClient;

  TeamRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<void> createTeam(
    String name,
    String tag,
    String? description,
    String? socialMedia,
    List<String>? gamesList,
    String? avatarUrl,
  ) async {
    try {
      await _apiClient.dio.post(
        '/teams',
        data: {
          'name': name,
          'tag': tag,
          'description': description,
          'socialMedia': socialMedia,
          'gamesList': gamesList,
          'avatarUrl': avatarUrl,
        },
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<TeamModel>> fetchUserTeams() async {
    try {
      final response = await _apiClient.dio.get('/teams/my');
      final List list = response.data;
      return list.map((json) => TeamModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<TeamModel> fetchTeamDetails(String teamId) async {
    try {
      final response = await _apiClient.dio.get('/teams/$teamId');
      return TeamModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> joinTeam(String teamId) async {
    try {
      await _apiClient.dio.post('/teams/$teamId/join');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> leaveTeam(String teamId) async {
    try {
      await _apiClient.dio.post('/teams/$teamId/leave');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> deleteTeam(String teamId) async {
    try {
      await _apiClient.dio.post('/teams/$teamId/delete');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<TeamModel>> searchTeams(String? query) async {
    try {
      final response = await _apiClient.dio.get(
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

  Future<List<TeamUserShort>> searchUser(String query) async {
    try {
      final response = await _apiClient.dio.get(
        '/users',
        queryParameters: {'search': query},
      );
      final List list = response.data;
      print('USER LIST: $list');
      return list.map((e) => TeamUserShort.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> inviteUserToTeam(String teamId, String userId) async {
    try {
      await _apiClient.dio.post(
        '/teams/$teamId/invite',
        data: {'userId': userId},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> sendJoinRequest(String teamId) async {
    try {
      await _apiClient.dio.post('/teams/$teamId/request');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<JoinRequestModel>> fetchJoinRequest(String teamId) async {
    try {
      final response = await _apiClient.dio.get('/teams/$teamId/requests');
      final List list = response.data;
      return list.map((json) => JoinRequestModel.fromJson(json)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> acceptJoinRequest(String requestId) async {
    try {
      await _apiClient.dio.post('/teams/requests/$requestId/accept');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> rejectJoinRequest(String requestId) async {
    try {
      await _apiClient.dio.post('/teams/requests/$requestId/reject');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<String?> uploadTeamLogo(String filePath) async {
    try {
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath, filename: fileName),
      });

      print('UPLOADING: $filePath');
      final response = await _apiClient.dio.post('/uploads', data: formData);
      print('UPLOAD RESPONSE: ${response.data}');

      final String relativeUrl = response.data['url'];

      final baseUrl = _apiClient.dio.options.baseUrl.replaceAll('/api/v1', '');

      print('FULL URL: $baseUrl$relativeUrl');
      return '$baseUrl$relativeUrl';
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> updateTeam(
    String teamId,
    String name,
    String tag,
    String? avatarUrl,
    String? description,
    String? socialMedia,
    List<String>? gamesList,
  ) async {
    try {
      final data = <String, dynamic>{};
      data['name'] = name;
      data['tag'] = tag;
      if (avatarUrl != null) data['avatarUrl'] = avatarUrl;
      if (description != null) data['description'] = description;
      if (socialMedia != null) data['socialMedia'] = socialMedia;
      if (gamesList != null) data['gamesList'] = gamesList;

      await _apiClient.dio.patch('/teams/$teamId', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> banTeam(String teamId, bool isBanned) async {
    try {
      await _apiClient.dio.patch(
        '/admin/teams/$teamId/ban',
        data: {'isBanned': isBanned},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
