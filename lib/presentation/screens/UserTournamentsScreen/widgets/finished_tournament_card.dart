import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FinishedTournamentCard extends StatelessWidget {
  final TournamentModel tournament;
  final String currentUserId;

  const FinishedTournamentCard({
    super.key,
    required this.tournament,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    String myName = 'Вы';
    String tag = '[ТЭГ]';

    try {
      final entry = tournament.entries.firstWhere(
        (e) => e.userId == currentUserId,
      );

      if (entry != null) {
        if (tournament.teamMode == TeamMode.solo) {
          myName = entry.user.nickname;
        } else {
          myName = entry.team?.name ?? 'Моя команда';
          tag = entry.team?.tag ?? '';
        }
      }
    } catch (e) {
      print("ERROR finding entry: $e");
    }

    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(24.0),
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
              '${tournament.discipline.title}, ${tournament.teamMode.title}, ${tournament.bracketType.title}',
              style: AppTextStyles.bodyM,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            const SizedBox(height: 16),
            if (tournament.teamMode == TeamMode.solo)
              Text(
                'Вы участвовали в соло',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.textPrimary,
                ),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ваша команда: ', style: AppTextStyles.bodyM),
                  Row(
                    children: [
                      Text(
                        '$myName ',
                        style: AppTextStyles.button,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '[$tag]',
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.accentPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
