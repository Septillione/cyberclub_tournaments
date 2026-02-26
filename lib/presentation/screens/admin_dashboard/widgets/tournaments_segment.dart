import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_search_field.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/admin_stats_section.dart';

class TournamentsSegment extends StatelessWidget {
  final List<TournamentEntity> tournaments;
  final AdminTournamentStats stats;

  const TournamentsSegment({
    super.key,
    required this.tournaments,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdminStatsSection(
          title: 'Статистика турниров',
          items: [
            AdminStatItem(label: 'Всего', value: stats.total),
            AdminStatItem(label: 'Сейчас идут', value: stats.live),
            AdminStatItem(label: 'Набор открыт', value: stats.open),
          ],
        ),
        const AdminSearchField(tabIndex: 0),
        const SizedBox(height: 16),
        Expanded(
          child: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.only(bottom: 80),
                itemCount: tournaments.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return TournamentCard(
                    tournament: tournaments[index],
                    isManager: true,
                  );
                },
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: GradientButton(
                  text: 'Создать турнир',
                  onPressed: () => context.push('/create-tournament'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
