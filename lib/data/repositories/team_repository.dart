import 'package:cyberclub_tournaments/data/models/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';

class TeamRepository {
  final List<TeamDetailModel> _mockTeamDetails = [
    TeamDetailModel(
      id: 'team-alpha',
      name: 'Team Alpha',
      tag: 'AW',
      avatarUrl:
          'https://liquipedia.net/commons/images/c/cd/Team_Alpha_darkmode.png',
      tournamentsCount: 12,
      winsCount: 8,
      winrate: 66.0,
      isCurrentUserCaptain: true,
      teammates: List.generate(
        5,
        (i) => TeammateModel(
          id: 'p$i',
          name: 'Alpha Player ${i + 1}',
          avatarUrl: 'https://i.pravatar.cc/150?u=$i',
          isCaptain: i == 0,
        ),
      ),
      tournaments: mockTournaments
          .where((t) => t.id == 't-dota-1' || t.id == 't-cs-1')
          .toList(),
      applications: List.generate(
        3,
        (i) => TeamApplicationModel(
          id: 'app$i',
          playerName: 'Newbie$i',
          playerAvatarUrl: 'https://i.pravatar.cc/150?u=newbie$i',
        ),
      ),
      inviteLink: 'cyber.club/join/alpha',
    ),
    TeamDetailModel(
      id: 'team-navi',
      name: 'NAVI',
      tag: 'NV',
      avatarUrl:
          'https://avatars.mds.yandex.net/i?id=4445e9d8d23dc7f5c99ed26c0b5f8949_l-4120615-images-thumbs&n=13',
      tournamentsCount: 34,
      winsCount: 26,
      winrate: 76.0,
      isCurrentUserCaptain: false,
      teammates: List.generate(
        5,
        (i) => TeammateModel(
          id: 'b$i',
          name: 'NAVI Player ${i + 1}',
          avatarUrl: 'https://i.pravatar.cc/150?u=bravo$i',
          isCaptain: i == 0,
        ),
      ),
      tournaments: mockTournaments
          .where((t) => t.id == 't-valorant-1' || t.id == 't-cs-1')
          .toList(),
      applications: [],
      inviteLink: 'cyber.club/join/navi',
    ),
  ];

  Future<List<TeamListItemModel>> fetchUserTeams(String userId) async {
    return _mockTeamDetails.map((detail) {
      final avatarUrls = detail.teammates.map((m) => m.avatarUrl).toList();

      return TeamListItemModel(
        id: detail.id,
        name: detail.name,
        tag: detail.tag,
        avatarUrl: detail.avatarUrl,
        isCurrentUserCaptain: detail.isCurrentUserCaptain,
        teammatesCount: detail.teammates.length,
        teammatesAvatarUrls: avatarUrls,
      );
    }).toList();
  }

  Future<TeamDetailModel> fetchTeamDetails(String teamId) async {
    return _mockTeamDetails.firstWhere(
      (t) => t.id == teamId,
      orElse: () => throw Exception('Команда не найдена'),
    );
  }

  // TeamModel? findTeamById(String id) {
  //   try {
  //     return _mockTeams.firstWhere((t) => t.id == id);
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
