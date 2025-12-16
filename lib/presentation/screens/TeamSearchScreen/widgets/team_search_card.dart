import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamSearchScreen/bloc/team_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 16),
              if (isMember || isOwner) ...[
                const Text('Вы участник'),
              ] else ...[
                ElevatedButton(
                  onPressed: () {
                    context.read<TeamSearchBloc>().add(
                      TeamSearchJoinRequested(team.id),
                    );
                  },
                  child: const Text('Вступить'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
