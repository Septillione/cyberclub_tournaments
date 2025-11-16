import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CardSetting extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const CardSetting({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 24, color: AppColors.textPrimary),
                const SizedBox(width: 8),
                Text(title, style: AppTextStyles.bodyL),
              ],
            ),
            const Icon(
              LucideIcons.arrowRight,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
