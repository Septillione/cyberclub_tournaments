import 'package:cyberclub_tournaments/data/models/EntryModel/entry_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';

class TeamRepository {
  final ApiClient _apiClient;
  final TournamentRepository _tournamentsRepository;

  TeamRepository({
    required ApiClient apiClient,
    required TournamentRepository tournamentsRepository,
  }) : _apiClient = apiClient,
       _tournamentsRepository = tournamentsRepository;

  final List<EntryModel> _mockEntries = [
    const EntryModel(
      id: 'entry-alpha-dota',
      tournamentId: 't-dota-1',
      teamId: 'team-alpha',
      playerIds: ['p0', 'p1', 'p2', 'p3', 'p4'],
      status: EntryStatus.accepted,
    ),
    const EntryModel(
      id: 'entry-alpha-cs',
      tournamentId: 't-cs-1',
      teamId: 'team-alpha',
      playerIds: ['p0', 'p1', 'p2', 'p3', 'p4'],
      status: EntryStatus.accepted,
    ),
    const EntryModel(
      id: 'entry-navi-valorant',
      tournamentId: 't-valorant-1',
      teamId: 'team-navi',
      playerIds: ['b0', 'b1', 'b2', 'b3', 'b4'],
      status: EntryStatus.accepted,
    ),
  ];

  List<TeamDetailModel> get _mockTeamDetails {
    return [
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
        tournaments: _tournamentsRepository.mockTournaments
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
        tournaments: _tournamentsRepository.mockTournaments
            .where((t) => t.id == 't-valorant-1' || t.id == 't-cs-1')
            .toList(),
        applications: [],
        inviteLink: 'cyber.club/join/navi',
      ),
    ];
  }

  Future<List<TeamListItemModel>> fetchUserTeams(String userId) async {
    return _mockTeamDetails.map((detail) {
      return TeamListItemModel(
        id: detail.id,
        name: detail.name,
        tag: detail.tag,
        avatarUrl: detail.avatarUrl,
        isCurrentUserCaptain: detail.isCurrentUserCaptain,
        teammatesCount: detail.teammates.length,
        teammatesAvatarUrls: detail.teammates.map((m) => m.avatarUrl).toList(),
      );
    }).toList();
  }

  Future<TeamDetailModel> fetchTeamDetails(String teamId) async {
    final originalTeamDetail = _mockTeamDetails.firstWhere(
      (team) => team.id == teamId,
      orElse: () => throw Exception('Команда не найдена'),
    );

    final acceptedEntries = _mockEntries
        .where(
          (entry) =>
              entry.teamId == teamId && entry.status == EntryStatus.accepted,
        )
        .toList();

    final tournamentIds = acceptedEntries
        .map((entry) => entry.tournamentId)
        .toSet();

    final teamTournaments = _tournamentsRepository.mockTournaments
        .where((tournament) => tournamentIds.contains(tournament.id))
        .toList();

    final updatedTeamTournaments = teamTournaments.map((tournament) {
      final entry = acceptedEntries.firstWhere(
        (e) => e.tournamentId == tournament.id,
      );
      return tournament.copyWith(registeredPlayerIds: entry.playerIds);
    }).toList();

    return originalTeamDetail.copyWith(tournaments: updatedTeamTournaments);
  }
}
