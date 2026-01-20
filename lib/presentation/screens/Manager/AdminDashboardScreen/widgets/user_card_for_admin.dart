import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UserCardForAdmin extends StatelessWidget {
  final TeamUserShort user;

  const UserCardForAdmin({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.bgMain,
              backgroundImage: user.avatarUrl != null
                  ? NetworkImage(user.avatarUrl!)
                  : null,
              child: user.avatarUrl == null
                  ? Icon(
                      LucideIcons.userRound,
                      color: AppColors.textSecondary,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(user.nickname, style: AppTextStyles.h3),
            const Spacer(),
            PopupMenuButton<String>(
              elevation: 4,
              color: AppColors.bgSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.bgMain, width: 1),
              ),
              offset: const Offset(0, 50),
              icon: const Icon(LucideIcons.ellipsisVertical, size: 24),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'change_role',
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.fireExtinguisher,
                        size: 20,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Изменить роль',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'ban',
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.fireExtinguisher,
                        size: 20,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Забанить',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
