import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/user_card_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_search_field.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_stats_section.dart';

class PlayersSegment extends StatelessWidget {
  final List<TeamUserShort> users;
  final AdminUserStats stats;

  const PlayersSegment({super.key, required this.users, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdminStatsSection(
          title: 'Статистика игроков',
          items: [
            AdminStatItem(label: 'Зарегистрировано', value: stats.total),
            AdminStatItem(label: 'Находятся в команде', value: stats.inTeams),
          ],
        ),
        const AdminSearchField(tabIndex: 1),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: users.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return UserCardForAdmin(user: users[index]);
            },
          ),
        ),
      ],
    );
  }
}
