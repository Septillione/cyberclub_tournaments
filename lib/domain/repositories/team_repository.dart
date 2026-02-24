import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';

abstract class TeamRepository {
  // Получение
  Future<List<TeamEntity>> fetchUserTeams();
  Future<TeamEntity> fetchTeamDetails(String teamId);
  Future<List<TeamEntity>> searchTeams(String? query);
  Future<List<TeamUserShort>> searchUsers(String query);
  Future<List<JoinRequestEntity>> getJoinRequests(String teamId);

  // Создание и изменение
  Future<void> createTeam(TeamEntity team);
  Future<void> updateTeam(TeamEntity team);
  Future<void> deleteTeam(String teamId);

  // Участие
  Future<void> joinTeam(String teamId);
  Future<void> leaveTeam(String teamId);

  // Приглашения и заявки
  Future<void> inviteUser(String teamId, String userId);
  Future<void> sendJoinRequest(String teamId);
  Future<void> acceptJoinRequest(String requestId);
  Future<void> rejectJoinRequest(String requestId);

  // Управление участниками
  Future<void> promoteTeammate(String teamId, String userId);
  Future<void> kickTeammate(String teamId, String userId);

  // Загрузка файлов
  Future<String?> uploadTeamLogo(String filePath);

  // Админ
  Future<void> banTeam(String teamId, bool isBanned);
}
