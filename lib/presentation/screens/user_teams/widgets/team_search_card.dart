import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/bloc/user_teams_bloc.dart';

class TeamSearchCard extends StatelessWidget {
  final TeamEntity team;
  final String currentUserId;

  const TeamSearchCard({
    super.key,
    required this.team,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final isMember = team.isMember(currentUserId);
    final isOwner = team.isOwner(currentUserId);

    final games = team.gamesList ?? [];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.bgSurface,
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => context.push('/my-teams/${team.id}'),
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.bgMain,
                    backgroundImage: team.avatarUrl != null
                        ? NetworkImage(team.avatarUrl!)
                        : null,
                    child: team.avatarUrl == null
                        ? const Icon(
                            LucideIcons.shield,
                            color: AppColors.textSecondary,
                            size: 20,
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${team.name} [${team.tag}]',
                    style: AppTextStyles.h3.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (games.isNotEmpty) _GamesList(games: games),
              const SizedBox(height: 16),
              if (isMember || isOwner)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Вы участник',
                      style: TextStyle(color: AppColors.greenColor),
                    ),
                  ),
                )
              else
                GradientButton(
                  text: 'Вступить',
                  onPressed: () => context.read<UserTeamsBloc>().add(
                    TeamsSearchJoinRequested(team.id),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GamesList extends StatelessWidget {
  final List<String> games;

  const _GamesList({required this.games});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: games
          .map((g) => Text('$g |', style: AppTextStyles.bodyM))
          .toList(),
    );
  }
}
