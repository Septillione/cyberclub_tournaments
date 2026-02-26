import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class FinishedTournamentCard extends StatelessWidget {
  final TournamentEntity tournament;
  final String currentUserId;

  const FinishedTournamentCard({
    super.key,
    required this.tournament,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tournament.title,
              style: AppTextStyles.h3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              '${tournament.discipline.title}, ${tournament.teamMode.title}',
              style: AppTextStyles.bodyM,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            const SizedBox(height: 16),
            Text(
              tournament.status == TournamentStatus.cancelled
                  ? 'Турнир был отменён'
                  : 'Турнир завершён',
              style: AppTextStyles.bodyM.copyWith(
                color: tournament.status == TournamentStatus.cancelled
                    ? AppColors.redColor
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
