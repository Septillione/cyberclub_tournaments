import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/overlapping_avatars.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamCard extends StatelessWidget {
  final TeamModel team;
  final String currentUserId;

  const TeamCard({super.key, required this.team, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final isCaptain = team.ownerId == currentUserId;
    final avatarUrls = team.members
        .map((m) => m.user.avatarUrl ?? '')
        .where((url) => url.isNotEmpty)
        .toList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.bgSurface,
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () => context.push('/my-teams/${team.id}'),
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: team.avatarUrl != null
                        ? NetworkImage(team.avatarUrl!)
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${team.name} [${team.tag}]',
                    style: AppTextStyles.h3.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('Роль: ', style: AppTextStyles.bodyM),
                  if (isCaptain) ...[
                    Text(
                      'Капитан',
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Участник',
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.bgMain, height: 1),
              const SizedBox(height: 16),
              Text(
                'Участников: ${team.members.length}',
                style: AppTextStyles.bodyM,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverlappingAvatars(
                    avatarUrls: avatarUrls,
                    totalCount: team.members.length,
                  ),
                  Icon(LucideIcons.arrowRight, color: AppColors.textPrimary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
