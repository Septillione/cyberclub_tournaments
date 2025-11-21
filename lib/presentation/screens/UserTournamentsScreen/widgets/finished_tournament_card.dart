import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FinishedTournamentCard extends StatelessWidget {
  final TournamentModel tournament;
  final String place;

  const FinishedTournamentCard({
    super.key,
    required this.tournament,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) =>
      //           TournamentDetailScreen(tournament: tournament),
      //     ),
      //   );
      // },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tournament.title, style: AppTextStyles.h3),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.textDisabled,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Text(
                      'Завершен',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Ваше место:  ',
                      style: AppTextStyles.bodyL.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(place, style: AppTextStyles.h3),
                    const SizedBox(width: 8),
                    const Icon(
                      LucideIcons.trophy,
                      size: 18,
                      color: AppColors.medalBronza,
                    ),
                  ],
                ),
                Icon(LucideIcons.arrowRight, color: AppColors.textPrimary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
