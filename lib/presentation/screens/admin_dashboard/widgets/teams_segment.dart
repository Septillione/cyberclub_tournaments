import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/team_card_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_search_field.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_stats_section.dart';

class TeamsSegment extends StatelessWidget {
  final List<TeamEntity> teams;
  final AdminTeamStats stats;

  const TeamsSegment({super.key, required this.teams, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdminStatsSection(
          title: 'Статистика команд',
          items: [
            AdminStatItem(label: 'Зарегистрировано', value: stats.total),
            AdminStatItem(label: 'Активных', value: stats.active),
          ],
        ),
        const AdminSearchField(tabIndex: 2),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemCount: teams.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return TeamCardForAdmin(team: teams[index]);
            },
          ),
        ),
      ],
    );
  }
}
