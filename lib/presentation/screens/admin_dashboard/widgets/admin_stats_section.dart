import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class AdminStatsSection extends StatelessWidget {
  final String title;
  final List<AdminStatItem> items;

  const AdminStatsSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: AppTextStyles.bodyL),
        const SizedBox(height: 16),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '${item.label}: ${item.value}',
              style: AppTextStyles.bodyL,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AdminStatItem {
  final String label;
  final int value;

  const AdminStatItem({required this.label, required this.value});
}
