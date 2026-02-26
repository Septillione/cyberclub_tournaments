import 'package:cyberclub_tournaments/presentation/screens/user_teams/widgets/overlapping_avatars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/bloc/user_teams_bloc.dart';

class TeamCard extends StatelessWidget {
  final TeamEntity team;
  final String currentUserId;

  const TeamCard({super.key, required this.team, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final isCaptain = team.ownerId == currentUserId;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.bgSurface,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () async {
          await context.push('/my-teams/${team.id}');
          if (context.mounted) {
            context.read<UserTeamsBloc>().add(UserTeamsStarted());
          }
        },
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: AppColors.bgMain,
                    backgroundImage: team.avatarUrl != null
                        ? NetworkImage(team.avatarUrl!)
                        : null,
                    child: team.avatarUrl == null
                        ? const Icon(
                            LucideIcons.shield,
                            color: AppColors.textSecondary,
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(team.name, style: AppTextStyles.h3),
                      Text(
                        '[${team.tag}]',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.accentPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _RoleInfo(isCaptain: isCaptain),
                  _MembersCount(count: team.members.length),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.bgMain, height: 1),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OverlappingAvatars(
                      avatarUrls: team.members
                          .map((m) => m.user.avatarUrl)
                          .toList(),
                      totalCount: team.members.length,
                    ),
                  ),
                  const Icon(
                    LucideIcons.arrowRight,
                    color: AppColors.textPrimary,
                    size: 24,
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

class _RoleInfo extends StatelessWidget {
  final bool isCaptain;

  const _RoleInfo({required this.isCaptain});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Роль: ', style: AppTextStyles.bodyM),
        Text(
          isCaptain ? 'Капитан' : 'Участник',
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}

class _MembersCount extends StatelessWidget {
  final int count;

  const _MembersCount({required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Состав ', style: AppTextStyles.bodyM),
        Text(
          '($count/5)',
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
