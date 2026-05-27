import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgSurface.withOpacity(0.8),
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.pop(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Icon(
            LucideIcons.arrowLeft,
            size: 24,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
