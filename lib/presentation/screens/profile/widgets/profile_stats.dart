import 'package:cyberclub_tournaments/presentation/widgetsnew/card_statistics.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';

class ProfileStats extends StatelessWidget {
  final UserStats stats;

  const ProfileStats({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CardStatistics(
              title: 'Турниров',
              value: '${stats.tournamentsPlayed}',
              color: AppColors.blueColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardStatistics(
              title: 'Побед',
              value: '${stats.tournamentsWon}',
              color: AppColors.redColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardStatistics(
              title: 'Winrate',
              value: '${stats.winrate}%',
              color: AppColors.greenColor,
            ),
          ),
        ],
      ),
    );
  }
}
