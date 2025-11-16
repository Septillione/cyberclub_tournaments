import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Text('$title:', style: AppTextStyles.bodyL),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.h3.copyWith(color: color)),
        ],
      ),
    );
  }
}
