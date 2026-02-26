import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.bgSurface.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
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
