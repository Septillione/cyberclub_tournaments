import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/ban_setup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/bloc/admin_dashboard_bloc.dart';

class UserCardForAdmin extends StatelessWidget {
  final TeamUserShort user;

  const UserCardForAdmin({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _UserAvatar(avatarUrl: user.avatarUrl),
          const SizedBox(width: 12),
          Expanded(child: Text(user.nickname, style: AppTextStyles.h3)),
          _AdminPopupMenu(user: user),
        ],
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

class _AdminPopupMenu extends StatelessWidget {
  final TeamUserShort user;

  const _AdminPopupMenu({required this.user});

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
      icon: const Icon(LucideIcons.ellipsisVertical, size: 24),
      onSelected: (value) => _handleMenuAction(context, value),
      itemBuilder: (_) => [
        _menuItem('change_role', LucideIcons.pen, 'Изменить роль'),
        _menuItem(
          'ban',
          LucideIcons.ban,
          user.isBanned ? 'Разбанить' : 'Забанить',
        ),
      ],
    );
  }

  PopupMenuItem<String> _menuItem(String value, IconData icon, String text) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.redColor),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.bodyM),
        ],
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    switch (action) {
      case 'ban':
        _showBanDialog(context);
      case 'change_role':
        _showRoleDialog(context);
    }
  }

  void _showBanDialog(BuildContext context) {
    final bloc = context.read<AdminDashboardBloc>();

    if (user.isBanned) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: Text('Разбанить ${user.nickname}?'),
          content: const Text('Пользователь снова сможет входить в систему.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
              ),
              onPressed: () {
                bloc.add(AdminUnbanUser(user.id));
                Navigator.pop(context);
              },
              child: const Text('Разбанить'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => BanSetupDialog(
          userName: user.nickname,
          onConfirm: (reason, days) {
            bloc.add(
              AdminToggleBanUser(userId: user.id, reason: reason, days: days),
            );
          },
        ),
      );
    }
  }

  void _showRoleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Выберите роль'),
        children: ['USER', 'MANAGER', 'ADMIN'].map((role) {
          return SimpleDialogOption(
            onPressed: () {
              context.read<AdminDashboardBloc>().add(
                AdminChangeUserRole(user.id, role as UserRole),
              );
              Navigator.pop(ctx);
            },
            child: Text(role),
          );
        }).toList(),
      ),
    );
  }
}
