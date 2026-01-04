import 'dart:ui';

import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class GoogleNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GoogleNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
            width: 0.5,
          ),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
          child: Container(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: GNav(
              selectedIndex: currentIndex,
              onTabChange: onTap,
              backgroundColor: Colors.transparent,
              color: AppColors.textSecondary,
              activeColor: AppColors.textPrimary,
              tabBackgroundColor: AppColors.accentPrimary.withValues(
                alpha: 0.2,
              ),
              hoverColor: AppColors.accentPrimary.withValues(alpha: 0.2),
              gap: 8,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

              tabs: const [
                GButton(icon: LucideIcons.gamepad2, text: 'Турниры'),
                GButton(icon: LucideIcons.swords, text: 'Мои турниры'),
                GButton(icon: LucideIcons.usersRound, text: 'Команды'),
                GButton(icon: LucideIcons.userRound, text: 'Профиль'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
