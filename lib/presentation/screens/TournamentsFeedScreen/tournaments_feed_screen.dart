import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_chip.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

final List<String> disciplineFilterChips = [
  'Все игры',
  'Dota 2',
  'CS 2',
  'Valorant',
  'League of Legends',
  'Fortnite',
  'Call of Duty: Warzone',
  'Мир танков',
  'PUBG',
  'Apex Legends',
  'Warface',
  'FIFA',
  'Overwatch 2',
  'Clash Royale',
  'Brawl Stars',
  'StarCraft II',
  'Mortal Kombat',
  'Тетрис',
];

final List<TournamentModel> mockTournaments = [
  TournamentModel(
    id: '1',
    title: 'Dota 2 Champions League: Season 18',
    imageUrl:
        'https://cs11.pikabu.ru/post_img/2019/04/29/5/og_og_1556521295259832113.jpg',
    discipline: 'Dota 2',
    startDate: DateTime.now().add(const Duration(days: 7)),
    status: TournamentStatus.registrationOpened,
    prizePool: '50 000 ₽',
    currentParticipants: 16,
    maxParticipants: 32,
    type: 'Онлайн',
    format: 'Single Elimination',
    formatVersus: '5v5',
    description:
        'Легендарный турнир возвращается! Собери команду и докажи свое превосходство на полях Древних.',
    rules: '1. Уважение к соперникам.\n2. Никаких читов.\n3. Матчи до 2 побед.',
    address: null,
    firstPlace: '30000 + Уникальный скин Пуджа',
    secondPlace: '15000',
    thirdPlace: '5000',
  ),
  TournamentModel(
    id: '2',
    title: 'CS 2 Masters Cup',
    imageUrl:
        'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1HH29y.img?w=2200&h=1100&m=4&q=79',
    discipline: 'CS 2',
    startDate: DateTime.now().add(const Duration(hours: 2)),
    status: TournamentStatus.live,
    prizePool: '100 000 ₽',
    currentParticipants: 8,
    maxParticipants: 8,
    type: 'Офлайн (LAN)',
    format: 'Double Elimination',
    formatVersus: '5v5',
    description:
        'Финальная битва сильнейших команд города. Приходите поддержать!',
    rules: 'Все стандартные правила ESL.',
    address: 'г. Москва, ул. Киберспортивная, д. 1',
    firstPlace: '60000',
    secondPlace: '30000',
    thirdPlace: '10000',
  ),
  TournamentModel(
    id: '3',
    title: 'Valorant Rising Stars',
    imageUrl:
        'https://avatars.mds.yandex.net/i?id=8d69330865cffb4f83e497a2f07381d1_l-5347442-images-thumbs&n=13',
    discipline: 'Valorant',
    startDate: DateTime.now().add(const Duration(days: 5)),
    prizePool: '45 000 ₽',
    status: TournamentStatus.registrationClosed,
    currentParticipants: 28,
    maxParticipants: 28,
    type: 'Офлайн (LAN)',
    format: 'Single Elimination',
    formatVersus: '5v5',
    description:
        'Легендарный турнир возвращается! Собери команду и докажи свое превосходство.',
    rules: 'Все стандартные правила ESL.',
    address: null,
    firstPlace: '30000',
    secondPlace: '15000',
    thirdPlace: null,
  ),
];

class TournamentsFeedScreen extends StatelessWidget {
  const TournamentsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              _buildFilter(),
              SizedBox(height: 24),
              _buildTournaments(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('CyberClub', style: AppTextStyles.h2),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                print('Search is pressed!');
              },
              child: Icon(
                LucideIcons.search,
                size: 24,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                print('Bell is pressed!');
              },
              child: Icon(
                LucideIcons.bell,
                size: 24,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilter() {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print('Filter is pressed!');
            },
            child: Icon(
              LucideIcons.slidersHorizontal,
              size: 32,
              color: AppColors.textSecondary,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: disciplineFilterChips.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return FilterChipWidget(
                  label: disciplineFilterChips[index],
                  isSelected: index == 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTournaments() {
    return Expanded(
      child: ListView.builder(
        itemCount: mockTournaments.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final tournament = mockTournaments[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TournamentCard(tournament: tournament),
          );
        },
      ),
    );
  }
}
