import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TournamentInfoItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color colorIcon;
  final String bodyText;

  const TournamentInfoItem({
    super.key,
    required this.title,
    required this.icon,
    required this.colorIcon,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.bgSurface,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(icon, color: colorIcon, size: 16),
              const SizedBox(width: 8),
              Text(title, style: AppTextStyles.bodyM),
            ],
          ),
          SizedBox(height: 16),
          Flexible(
            child: Text(
              bodyText,
              style: AppTextStyles.bodyL.copyWith(height: 1.2),
            ),
          ),
        ],
      ),
    );
  }
}
