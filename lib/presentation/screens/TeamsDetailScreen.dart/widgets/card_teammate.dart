import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CardTeammate extends StatelessWidget {
  final TeammateModel teammate;
  final bool isCaptain;

  const CardTeammate({
    super.key,
    required this.teammate,
    required this.isCaptain,
  });

  @override
  Widget build(BuildContext context) {
    final bool isCurrentUser = teammate.id == 'p0';

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.0),
        border: isCurrentUser
            ? Border.all(color: AppColors.accentPrimary)
            : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(teammate.avatarUrl),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Text(teammate.name, style: AppTextStyles.h3),
          const Spacer(),
          Text(
            teammate.isCaptain ? 'Капитан' : 'Игрок',
            style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
          ),
          if (isCaptain && !teammate.isCaptain) ...[
            PopupMenuButton<String>(
              child: const Icon(LucideIcons.ellipsisVertical, size: 24),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'promote',
                  child: Text('Передать капитанство'),
                ),
                const PopupMenuItem(
                  value: 'kick',
                  child: Text('Исключить из команды'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
