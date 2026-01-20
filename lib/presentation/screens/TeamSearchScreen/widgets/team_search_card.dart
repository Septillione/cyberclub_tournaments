import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamSearchCard extends StatelessWidget {
  final TeamModel team;
  final String currentUserId;

  const TeamSearchCard({
    super.key,
    required this.team,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final isMember = team.members.any((m) => m.userId == currentUserId);
    final isOwner = team.ownerId == currentUserId;
    final gamesList = team.gamesList;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: AppColors.bgSurface,
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () => context.push('/my-teams/${team.id}'),
        borderRadius: BorderRadius.circular(24.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                        ? Icon(
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
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  ...gamesList?.map(
                        (game) =>
                            Text('$game  |  ', style: AppTextStyles.bodyM),
                      ) ??
                      [],
                ],
              ),
              const SizedBox(height: 16),
              if (isMember || isOwner) ...[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text('Вы участник', style: AppTextStyles.button),
                  ),
                ),
              ] else ...[
                GradientButton(
                  text: 'Вступить',
                  onPressed: () {
                    context.read<UserTeamsBloc>().add(
                      UserTeamsSearchJoinRequested(team.id),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
