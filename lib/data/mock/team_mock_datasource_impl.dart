// lib/data/datasources/team_mock_datasource_impl.dart
import 'package:cyberclub_tournaments/data/datasources/team_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mock/mock_data.dart';
import 'package:cyberclub_tournaments/data/models/join_request/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/team/team_model.dart';
import 'package:flutter/material.dart';

class TeamMockDataSourceImpl implements TeamRemoteDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 600));

  @override
  Future<List<TeamModel>> fetchUserTeams() async {
    await _delay();
    debugPrint("MOCK: Fetching user's teams...");
    return mockTeams
        .where((team) => team.ownerId == mockCurrentUser.id)
        .toList();
  }

  @override
  Future<TeamModel> fetchTeamDetails(String teamId) async {
    await _delay();
    debugPrint("MOCK: Fetching team details for id: $teamId");
    return mockTeams.firstWhere((team) => team.id == teamId);
  }

  @override
  Future<List<TeamModel>> searchTeams(String? query) async {
    await _delay();
    debugPrint("MOCK: Searching teams with query: $query");
    if (query == null || query.isEmpty) return mockTeams;
    return mockTeams
        .where((team) => team.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // --- Остальные методы просто имитируют успех или возвращают пустые списки ---
  @override
  Future<List<TeamUserShortModel>> searchUsers(String query) async {
    await _delay();
    return [];
  }

  @override
  Future<List<JoinRequestModel>> getJoinRequests(String teamId) async {
    await _delay();
    return [];
  }

  @override
  Future<void> createTeam(Map<String, dynamic> data) async {
    await _delay();
  }

  @override
  Future<void> updateTeam(String teamId, Map<String, dynamic> data) async {
    await _delay();
  }

  @override
  Future<void> deleteTeam(String teamId) async {
    await _delay();
  }

  @override
  Future<void> joinTeam(String teamId) async {
    await _delay();
  }

  @override
  Future<void> leaveTeam(String teamId) async {
    await _delay();
  }

  @override
  Future<void> inviteUser(String teamId, String userId) async {
    await _delay();
  }

  @override
  Future<void> sendJoinRequest(String teamId) async {
    await _delay();
  }

  @override
  Future<void> acceptJoinRequest(String requestId) async {
    await _delay();
  }

  @override
  Future<void> rejectJoinRequest(String requestId) async {
    await _delay();
  }

  @override
  Future<void> promoteTeammate(String teamId, String userId) async {
    await _delay();
  }

  @override
  Future<void> kickTeammate(String teamId, String userId) async {
    await _delay();
  }

  @override
  Future<String?> uploadTeamLogo(String filePath) async {
    await _delay();
    return "https://i.pravatar.cc/300";
  }

  @override
  Future<void> banTeam(String teamId, bool isBanned) async {
    await _delay();
  }
}
