import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UpcomingTournamentCard extends StatelessWidget {
  final TournamentModel tournament;

  const UpcomingTournamentCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'd MMMM, HH:mm',
      'ru_RU',
    ).format(tournament.startDate);

    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tournament.title, style: AppTextStyles.h3),
            const SizedBox(height: 8),
            Text('Начало: $formattedDate', style: AppTextStyles.bodyM),
            const SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Командный турнир', style: AppTextStyles.bodyM),
                const Icon(
                  LucideIcons.arrowRight,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
