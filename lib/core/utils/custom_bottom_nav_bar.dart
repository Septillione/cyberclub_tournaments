import 'dart:ui';

import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            top: BorderSide(color: AppColors.navBarLine, width: 1.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final bool isSelected = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              width: isSelected ? 80 : 70,
              height: isSelected ? 80 : 60,
              child: InkWell(
                onTap: () => onTap(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected
                          ? AppColors.accentPrimary
                          : AppColors.textSecondary,
                      size: isSelected ? 26 : 24,
                    ),
                    const SizedBox(height: 2),
                    AnimatedOpacity(
                      opacity: isSelected ? 1.0 : 0.7,
                      duration: const Duration(microseconds: 200),
                      child: Text(
                        item.label,
                        style: AppTextStyles.caption.copyWith(
                          color: isSelected
                              ? AppColors.accentPrimary
                              : AppColors.textSecondary,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class GlassmorphismBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GlassmorphismBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.bgMain.withValues(alpha: 0.5),
          elevation: 0,
          unselectedItemColor: AppColors.textSecondary,
          selectedItemColor: AppColors.accentPrimary,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.gamepad2),
              label: 'Турниры',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.swords),
              label: 'Мои турниры',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.users2),
              label: 'Команды',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user2),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}

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
      decoration: BoxDecoration(color: AppColors.bgMain.withValues(alpha: 0.8)),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
              right: 15.0,
              bottom: 20.0,
            ),
            child: GNav(
              selectedIndex: currentIndex,
              onTabChange: onTap,
              backgroundColor: Colors.transparent,
              color: AppColors.textSecondary,
              activeColor: AppColors.accentPrimary,
              tabBackgroundColor: AppColors.accentPrimary.withValues(
                alpha: 0.1,
              ),
              hoverColor: AppColors.accentPrimary.withValues(alpha: 0.3),
              gap: 8,
              padding: const EdgeInsets.all(16),

              tabs: const [
                GButton(icon: LucideIcons.gamepad2, text: 'Турниры'),
                GButton(icon: LucideIcons.swords, text: 'Мои турниры'),
                GButton(icon: LucideIcons.users2, text: 'Команды'),
                GButton(icon: LucideIcons.user2, text: 'Профиль'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
