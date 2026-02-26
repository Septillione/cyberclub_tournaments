import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/bloc/team_detail_bloc.dart';

class CardTeammate extends StatelessWidget {
  final TeamMember teammate;
  final String ownerId;
  final String currentUserId;
  final String teamId;

  const CardTeammate({
    super.key,
    required this.teammate,
    required this.ownerId,
    required this.currentUserId,
    required this.teamId,
  });

  @override
  Widget build(BuildContext context) {
    final user = teammate.user;
    final isCaptain = teammate.userId == ownerId;
    final canManage =
        currentUserId == ownerId && teammate.userId != currentUserId;
    final isMe = teammate.userId == currentUserId;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12),
          border: isMe ? Border.all(color: AppColors.accentPrimary) : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.push('/profile/${user.id}'),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _UserAvatar(avatarUrl: user.avatarUrl),
                const SizedBox(width: 12),
                Text(user.nickname, style: AppTextStyles.h3),
                const Spacer(),
                Text(
                  isCaptain ? 'Капитан' : 'Игрок',
                  style: AppTextStyles.bodyL.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (canManage)
                  _ActionsMenu(teamId: teamId, userId: teammate.userId),
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

  const _UserAvatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.bgMain,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null
          ? const Icon(
              LucideIcons.userRound,
              color: AppColors.textSecondary,
              size: 20,
            )
          : null,
    );
  }
}

class _ActionsMenu extends StatelessWidget {
  final String teamId;
  final String userId;

  const _ActionsMenu({required this.teamId, required this.userId});

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
        if (value == 'promote') _showDialog(context, isPromote: true);
        if (value == 'kick') _showDialog(context, isPromote: false);
      },
      itemBuilder: (_) => [
        _menuItem(
          'promote',
          LucideIcons.crown,
          'Передать права',
          AppColors.textPrimary,
        ),
        _menuItem(
          'kick',
          LucideIcons.userMinus,
          'Исключить',
          AppColors.redColor,
        ),
      ],
    );
  }

  PopupMenuItem<String> _menuItem(
    String value,
    IconData icon,
    String text,
    Color color,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.bodyM.copyWith(color: color)),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, {required bool isPromote}) {
    final bloc = context.read<TeamDetailBloc>();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: Text(
          isPromote ? 'Передать права?' : 'Исключить игрока?',
          style: AppTextStyles.h3,
        ),
        content: Text(
          isPromote
              ? 'Вы потеряете права владельца.'
              : 'Игрок будет удален из команды.',
          style: AppTextStyles.bodyM,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isPromote
                  ? AppColors.accentPrimary
                  : AppColors.redColor,
            ),
            onPressed: () {
              final event = isPromote
                  ? TeamDetailPromoteTeammate(teamId: teamId, userId: userId)
                  : TeamDetailKickTeammate(teamId: teamId, userId: userId);
              bloc.add(event);
              Navigator.pop(context);
            },
            child: Text(
              isPromote ? 'Передать' : 'Исключить',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
