import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/bloc/admin_dashboard_bloc.dart';

class TeamCardForAdmin extends StatelessWidget {
  final TeamEntity team;

  const TeamCardForAdmin({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/my-teams/${team.id}'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _TeamAvatar(avatarUrl: team.avatarUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '${team.name} [${team.tag}]',
                style: AppTextStyles.h3,
              ),
            ),
            _TeamPopupMenu(team: team),
          ],
        ),
      ),
    );
  }
}

class _TeamAvatar extends StatelessWidget {
  final String? avatarUrl;

  const _TeamAvatar({this.avatarUrl});

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

class _TeamPopupMenu extends StatelessWidget {
  final TeamEntity team;

  const _TeamPopupMenu({required this.team});

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
      onSelected: (value) => _handleAction(context, value),
      itemBuilder: (_) => [
        _menuItem('edit', LucideIcons.pencil, 'Редактировать'),
        _menuItem(
          'ban',
          LucideIcons.ban,
          team.isBanned ? 'Разбанить' : 'Забанить',
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

  void _handleAction(BuildContext context, String action) {
    switch (action) {
      case 'edit':
        context.push('/edit-team', extra: team);
      case 'ban':
        _showBanDialog(context);
    }
  }

  void _showBanDialog(BuildContext context) {
    final bloc = context.read<AdminDashboardBloc>();

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                team.isBanned
                    ? 'Разбанить ${team.name}?'
                    : 'Забанить ${team.name}?',
                style: AppTextStyles.h3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: team.isBanned
                            ? AppColors.greenColor
                            : AppColors.redColor,
                      ),
                      onPressed: () {
                        bloc.add(AdminToggleBanTeam(team.id, !team.isBanned));
                        Navigator.pop(context);
                      },
                      child: Text(team.isBanned ? 'Разбанить' : 'Забанить'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Отмена'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
