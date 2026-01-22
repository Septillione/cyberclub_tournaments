import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Participant {
  final String id;
  final String name;
  final String? avatarUrl;

  Participant({required this.id, required this.name, required this.avatarUrl});
}

class ParticipantsDetails extends StatelessWidget {
  final TournamentModel tournament;

  const ParticipantsDetails({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    final entries = tournament.entries;
    final isTeamMode = tournament.teamMode != TeamMode.solo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Участники:', style: AppTextStyles.h3),
            Text(
              '${tournament.participants.current}/${tournament.participants.max}',
              style: AppTextStyles.h3,
            ),
          ],
        ),
        SizedBox(height: 24),

        if (entries.isEmpty) ...[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Пока никто не зарегистрировался.\nСтаньте первым!',
                style: AppTextStyles.bodyM,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ] else ...[
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = entries[index];

              final String name;
              final String? avatarUrl;
              final String? tag;
              final String targetId;

              if (isTeamMode && entry.team != null) {
                name = entry.team!.name;
                tag = '[${entry.team!.tag}]';
                avatarUrl = entry.team!.avatarUrl;
                targetId = entry.team!.id;
              } else {
                name = entry.user.nickname;
                tag = null;
                avatarUrl = entry.user.avatarUrl;
                targetId = entry.user.id;
              }

              return _buildParticipantCard(
                name,
                avatarUrl,
                tag,
                isTeamMode,
                targetId,
                context,
              );
            },
          ),
        ],
      ],
    );
  }

  Widget _buildParticipantCard(
    String name,
    String? avatarUrl,
    String? subTitle,
    bool isTeam,
    String id,
    BuildContext context,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: () {
        if (isTeam) {
          context.push('/my-teams/$id');
        } else {
          context.push('/profile/$id');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.bgMain,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl)
                  : null,
              child: avatarUrl == null
                  ? Icon(
                      isTeam ? LucideIcons.shield : LucideIcons.userRound,
                      color: AppColors.textSecondary,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.nameParticipant.copyWith(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.accentPrimary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
