// lib/data/datasources/mock_data.dart

import 'package:cyberclub_tournaments/data/models/team/team_model.dart';
import 'package:cyberclub_tournaments/data/models/tournament/tournament_model.dart';
import 'package:cyberclub_tournaments/data/models/user/user_model.dart';

// =======================================================================
// ==                               USERS                               ==
// =======================================================================

final mockCurrentUser = const UserModel(
  id: 'user_1',
  nickname: 'ProGamer_228',
  email: 'pro@gamer.com',
  role: 'USER',
  avatarUrl: 'https://i.pravatar.cc/150?u=user_1',
  bio:
      'Играю с пеленок. Ищу команду для покорения вершин киберспорта. Любимые игры: CS, Dota 2.',
  stats: UserStatsModel(
    tournamentsPlayed: 10,
    tournamentsWon: 2,
    winrate: 66.0,
  ),
  isBanned: false,
  entries: [],
);

final mockOtherUser = const UserModel(
  id: 'user_2',
  nickname: 'CyberCat',
  email: 'cat@cyber.com',
  role: 'USER',
  avatarUrl: 'https://i.pravatar.cc/150?u=user_2',
  bio: 'Стримерша и просто хороший человек.',
  stats: UserStatsModel(tournamentsPlayed: 5, tournamentsWon: 1, winrate: 75.0),
  isBanned: false,
  entries: [],
);

final mockManagerUser = const UserModel(
  id: 'manager_1',
  nickname: 'TournamentMaster',
  email: 'master@tournaments.com',
  role: 'MANAGER',
  avatarUrl: 'https://i.pravatar.cc/150?u=manager_1',
  bio: 'Организую лучшие турниры в этом городе!',
  stats: UserStatsModel(),
  isBanned: false,
  entries: [],
);

final List<UserModel> mockUsers = [
  mockCurrentUser,
  mockOtherUser,
  mockManagerUser,
];

// =======================================================================
// ==                           TOURNAMENTS                             ==
// =======================================================================

final mockTournament1 = TournamentModel(
  id: 'tour_1',
  title: 'CS2 Summer Clash 2024',
  discipline: 'CS2',
  status: 'ANNOUNCED',
  isOnline: true,
  teamMode: 'TEAM_5V5',
  bracketType: 'SINGLE_ELIMINATION',
  startDate: DateTime.now().add(const Duration(days: 10)),
  imageUrl: 'https://escorenews.com/media/news/n39670.jpg',
  participants: const ParticipantsInfoModel(current: 4, max: 16),
  description:
      'Большой летний турнир по Counter-Strike 2. Приглашаем всех желающих!',
  rules: 'Стандартные правила соревновательного CS. Все матчи BO1, финал BO3.',
  creatorId: 'manager_1',
  prizes: [
    const PrizeItemModel(label: '1 место', amount: '50000 RUB'),
    const PrizeItemModel(label: '2 место', amount: '25000 RUB'),
  ],
  entries: [
    TournamentEntryItemModel(
      id: 'entry_1',
      userId: 'user_1',
      teamId: 'team_1',
      team: const TeamShortInfoModel(
        id: 'team_1',
        name: 'Natus Vincere',
        tag: 'NAVI',
      ),
      user: TeamUserShortModel(
        id: 'user_1',
        nickname: 'ProGamer_228',
        avatarUrl: mockCurrentUser.avatarUrl,
      ),
    ),
  ],
);

final mockTournament2 = TournamentModel(
  id: 'tour_2',
  title: 'Dota 2 Champions League',
  discipline: 'DOTA2',
  status: 'LIVE',
  isOnline: false,
  address: 'Москва, ул. Киберспортивная, д. 1',
  teamMode: 'TEAM_5V5',
  bracketType: 'DOUBLE_ELIMINATION',
  startDate: DateTime.now().subtract(const Duration(days: 1)),
  imageUrl:
      'https://img.championat.com/c/1200x900/news/big/x/k/dota-2-champions-league-2021-season-5_1636450650130283038.jpg',
  participants: const ParticipantsInfoModel(current: 8, max: 8),
  description: 'Финал лиги чемпионов по Dota 2. Только лучшие команды!',
  rules: 'Режим Captains Mode. Все матчи BO3.',
  creatorId: 'manager_1',
  prizes: [const PrizeItemModel(label: '1 место', amount: '100000 RUB')],
  matches: [
    const MatchItemModel(
      id: 'match_1',
      round: 1,
      position: 1,
      participant1: 'team_1',
      participant2: 'team_2',
      score1: 1,
      score2: 0,
    ),
    const MatchItemModel(
      id: 'match_2',
      round: 1,
      position: 2,
      participant1: 'team_3',
      participant2: 'team_4',
    ),
  ],
);

final List<TournamentModel> mockTournaments = [
  mockTournament1,
  mockTournament2,
];

// =======================================================================
// ==                               TEAMS                               ==
// =======================================================================

final mockTeam1 = TeamModel(
  id: 'team_1',
  name: 'Natus Vincere',
  tag: 'NAVI',
  ownerId: 'user_1',
  avatarUrl:
      'https://www.meme-arsenal.com/memes/1105e26c449c25de10645f782c5f7d24.jpg',
  description: 'Легендарная команда, рожденная побеждать!',
  members: [
    TeamMemberModel(
      id: 'member_1',
      userId: 'user_1',
      teamId: 'team_1',
      user: TeamUserShortModel(
        id: 'user_1',
        nickname: 'ProGamer_228',
        avatarUrl: mockCurrentUser.avatarUrl,
      ),
    ),
    TeamMemberModel(
      id: 'member_2',
      userId: 'user_2',
      teamId: 'team_1',
      user: TeamUserShortModel(
        id: 'user_2',
        nickname: 'CyberCat',
        avatarUrl: mockOtherUser.avatarUrl,
      ),
    ),
  ],
  stats: const TeamStatsModel(
    tournamentsPlayed: 25,
    tournamentsWon: 10,
    winrate: 80.0,
  ),
  entries: [
    TeamEntryModel(
      id: 'entry_team_1',
      status: 'CONFIRMED',
      tournament: mockTournament1,
    ),
  ],
);

final mockTeam2 = TeamModel(
  id: 'team_2',
  name: 'CyberWolves',
  tag: 'CW',
  ownerId: 'manager_1',
  avatarUrl: 'https://i.pravatar.cc/300?u=team_2',
  description: 'Молодая и амбициозная команда, ищем таланты.',
  members: [
    TeamMemberModel(
      id: 'member_3',
      userId: 'manager_1',
      teamId: 'team_2',
      user: TeamUserShortModel(
        id: 'manager_1',
        nickname: 'TournamentMaster',
        avatarUrl: mockManagerUser.avatarUrl,
      ),
    ),
  ],
  stats: const TeamStatsModel(
    tournamentsPlayed: 3,
    tournamentsWon: 1,
    winrate: 60.0,
  ),
  entries: [
    TeamEntryModel(
      id: 'entry_team_2',
      status: 'CONFIRMED',
      tournament: mockTournament2,
    ),
  ],
);

final List<TeamModel> mockTeams = [mockTeam1, mockTeam2];
