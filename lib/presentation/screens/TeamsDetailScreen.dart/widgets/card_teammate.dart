import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CardTeammate extends StatelessWidget {
  final TeamMemberModel teammate;
  final String ownerId;
  final String currentUserId;

  const CardTeammate({
    super.key,
    required this.teammate,
    required this.ownerId,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final user = teammate.user;

    final isTeammateCaptain = teammate.userId == ownerId;
    final isViewerCaptain = currentUserId == ownerId;
    final isMyCard = teammate.userId == currentUserId;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12.0),
          border: isMyCard ? Border.all(color: AppColors.accentPrimary) : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            context.push('/profile/${user.id}');
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                _UserAvatar(avatarUrl: user.avatarUrl),
                const SizedBox(width: 12),
                Text(user.nickname, style: AppTextStyles.h3),
                const Spacer(),
                Text(
                  isTeammateCaptain ? 'Капитан' : 'Игрок',
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (isViewerCaptain && !isMyCard) ...[
                  _TeammateActionsMenu(onPromote: () {}, onKick: () {}),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String? avatarUrl;

  const _UserAvatar({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.bgMain,
      backgroundImage: hasImage ? NetworkImage(avatarUrl!) : null,
      child: !hasImage
          ? const Icon(
              LucideIcons.userRound,
              color: AppColors.textSecondary,
              size: 20,
            )
          : null,
    );
  }
}

class _TeammateActionsMenu extends StatelessWidget {
  final VoidCallback onPromote;
  final VoidCallback onKick;

  const _TeammateActionsMenu({required this.onPromote, required this.onKick});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      elevation: 4,
      color: AppColors.bgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.bgMain, width: 1),
      ),
      offset: const Offset(0, 50),
      icon: const Icon(
        LucideIcons.ellipsisVertical,
        size: 24,
        color: AppColors.textSecondary,
      ),
      onSelected: (value) {
        if (value == 'promote') onPromote();
        if (value == 'kick') onKick();
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'promote',
          child: Row(
            children: [
              const Icon(
                LucideIcons.crown,
                size: 20,
                color: AppColors.textPrimary,
              ),
              const SizedBox(width: 8),
              Text('Передать права', style: AppTextStyles.bodyM),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'kick',
          child: Row(
            children: [
              const Icon(
                LucideIcons.userMinus,
                size: 20,
                color: AppColors.redColor,
              ),
              const SizedBox(width: 8),
              Text(
                'Исключить',
                style: AppTextStyles.bodyM.copyWith(color: AppColors.redColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
