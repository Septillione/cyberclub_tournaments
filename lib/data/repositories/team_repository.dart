import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class TeamRepository {
  final ApiClient _apiClient;

  TeamRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<void> createTeam(String name, String tag, String? avatarUrl) async {
    await _apiClient.dio.post(
      '/teams',
      data: {'name': name, 'tag': tag, 'avatarUrl': avatarUrl},
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
    await _apiClient.dio.post('/teams/$teamId/leave');
  }
}
