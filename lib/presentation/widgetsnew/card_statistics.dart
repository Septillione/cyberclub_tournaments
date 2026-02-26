import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class CardStatistics extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const CardStatistics({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTextStyles.bodyL),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              value,
              style: AppTextStyles.bodyL.copyWith(height: 1.2),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
