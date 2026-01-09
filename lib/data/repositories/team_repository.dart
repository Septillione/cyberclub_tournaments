import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

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
  }

  Future<List<TeamModel>> fetchUserTeams() async {
    final response = await _apiClient.dio.get('/teams/my');
    final List list = response.data;
    return list.map((json) => TeamModel.fromJson(json)).toList();
  }

  Future<TeamModel> fetchTeamDetails(String teamId) async {
    final response = await _apiClient.dio.get('/teams/$teamId');
    return TeamModel.fromJson(response.data);
  }

  Future<void> joinTeam(String teamId) async {
    await _apiClient.dio.post('/teams/$teamId/join');
  }

  Future<void> leaveTeam(String teamId) async {
    await _apiClient.dio.delete('/teams/$teamId/leave');
  }

  Future<List<TeamModel>> searchTeams(String query) async {
    try {
      final response = await _apiClient.dio.get(
        '/teams',
        queryParameters: {'search': query},
      );
      if (response.data == null) return [];
      final List list = response.data;
      return list.map((json) => TeamModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> sendJoinRequest(String teamId) async {
    await _apiClient.dio.post('/teams/$teamId/request');
  }

  Future<List<JoinRequestModel>> fetchJoinRequest(String teamId) async {
    try {
      final response = await _apiClient.dio.get('/teams/$teamId/requests');
      final List list = response.data;
      return list.map((json) => JoinRequestModel.fromJson(json)).toList();
    } catch (e) {
      print('Ошибка загрузки заявок $e');
      return [];
    }
  }

  Future<void> acceptJoinRequest(String requestId) async {
    await _apiClient.dio.post('/teams/requests/$requestId/accept');
  }

  Future<void> rejectJoinRequest(String requestId) async {
    await _apiClient.dio.post('/teams/requests/$requestId/reject');
  }
}
