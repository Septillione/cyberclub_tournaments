import 'package:cyberclub_tournaments/datanew/datasources/team_remote_datasource.dart';
import 'package:cyberclub_tournaments/datanew/mappers/join_request_mapper.dart';
import 'package:cyberclub_tournaments/datanew/mappers/team_mapper.dart';
import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class TeamRepositoryImpl implements TeamRepository {
  final TeamRemoteDataSource _dataSource;

  TeamRepositoryImpl({required TeamRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<TeamEntity>> fetchUserTeams() async {
    final models = await _dataSource.fetchUserTeams();
    return models.map(TeamMapper.toEntity).toList();
  }

  @override
  Future<TeamEntity> fetchTeamDetails(String teamId) async {
    final model = await _dataSource.fetchTeamDetails(teamId);
    return TeamMapper.toEntity(model);
  }

  @override
  Future<List<TeamEntity>> searchTeams(String? query) async {
    final models = await _dataSource.searchTeams(query);
    return models.map(TeamMapper.toEntity).toList();
  }

  @override
  Future<List<TeamUserShort>> searchUsers(String query) async {
    final models = await _dataSource.searchUsers(query);
    return models.map(TeamMapper.userShortToEntity).toList();
  }

  @override
  Future<List<JoinRequestEntity>> getJoinRequests(String teamId) async {
    final models = await _dataSource.getJoinRequests(teamId);
    return models.map(JoinRequestMapper.toEntity).toList();
  }

  @override
  Future<void> createTeam(TeamEntity team) async {
    // Entity → данные для запроса
    final data = {
      'name': team.name,
      'tag': team.tag,
      'description': team.description,
      'socialMedia': team.socialMedia,
      'gamesList': team.gamesList,
      'avatarUrl': team.avatarUrl,
    };
    await _dataSource.createTeam(data);
  }

  @override
  Future<void> updateTeam(TeamEntity team) async {
    final data = <String, dynamic>{'name': team.name, 'tag': team.tag};
    if (team.avatarUrl != null) data['avatarUrl'] = team.avatarUrl;
    if (team.description != null) data['description'] = team.description;
    if (team.socialMedia != null) data['socialMedia'] = team.socialMedia;
    if (team.gamesList != null) data['gamesList'] = team.gamesList;

    await _dataSource.updateTeam(team.id, data);
  }

  @override
  Future<void> deleteTeam(String teamId) => _dataSource.deleteTeam(teamId);

  @override
  Future<void> joinTeam(String teamId) => _dataSource.joinTeam(teamId);

  @override
  Future<void> leaveTeam(String teamId) => _dataSource.leaveTeam(teamId);

  @override
  Future<void> inviteUser(String teamId, String userId) =>
      _dataSource.inviteUser(teamId, userId);

  @override
  Future<void> sendJoinRequest(String teamId) =>
      _dataSource.sendJoinRequest(teamId);

  @override
  Future<void> acceptJoinRequest(String requestId) =>
      _dataSource.acceptJoinRequest(requestId);

  @override
  Future<void> rejectJoinRequest(String requestId) =>
      _dataSource.rejectJoinRequest(requestId);

  @override
  Future<void> promoteTeammate(String teamId, String userId) =>
      _dataSource.promoteTeammate(teamId, userId);

  @override
  Future<void> kickTeammate(String teamId, String userId) =>
      _dataSource.kickTeammate(teamId, userId);

  @override
  Future<String?> uploadTeamLogo(String filePath) =>
      _dataSource.uploadTeamLogo(filePath);

  @override
  Future<void> banTeam(String teamId, bool isBanned) =>
      _dataSource.banTeam(teamId, isBanned);
}
