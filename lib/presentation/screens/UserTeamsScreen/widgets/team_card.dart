import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamCard extends StatelessWidget {
  final TeamModel team;
  final String currentUserId;

  const TeamCard({super.key, required this.team, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    print('DEBUG: Team Owner: ${team.ownerId} vs Me: $currentUserId');

    final isCaptain = team.ownerId == currentUserId;
    final avatarUrls = team.members
        .map((m) => m.user.avatarUrl ?? '')
        .where((url) => url.isNotEmpty)
        .toList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColors.bgSurface,
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () async {
          await context.push('/my-teams/${team.id}');
          if (context.mounted) {
            context.read<UserTeamsBloc>().add(UserTeamsStarted());
          }
        },
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: team.avatarUrl != null
                        ? NetworkImage(team.avatarUrl!)
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
                  Row(
                    children: [
                      Text('Роль: ', style: AppTextStyles.bodyM),
                      if (isCaptain)
                        Text(
                          'Капитан',
                          style: AppTextStyles.bodyM.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        )
                      else
                        Text(
                          'Участник',
                          style: AppTextStyles.bodyM.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                    ],
                  ),

                  Row(
                    children: [
                      Text('Состав ', style: AppTextStyles.bodyM),
                      Text(
                        '(${team.members.length}/5)',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.bgMain, height: 1),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.accentPrimary,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.accentPrimary,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.accentPrimary,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.accentPrimary,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.accentPrimary,
                      ),
                    ],
                  ),
                  const Icon(
                    LucideIcons.arrowRight,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                ],
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     OverlappingAvatars(
              //       avatarUrls: avatarUrls,
              //       totalCount: team.count?['members'] ?? team.members.length,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
