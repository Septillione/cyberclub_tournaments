import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(
          LucideIcons.arrowLeft,
          size: 24,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
