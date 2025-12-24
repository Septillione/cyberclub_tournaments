import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
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
            Text(
              'Участники: ${tournament.participants.current}/${tournament.participants.max}',
              style: AppTextStyles.h3,
            ),
            Text(
              '${tournament.participants.current}/${tournament.participants.max}',
              style: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
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

              if (isTeamMode && entry.team != null) {
                name = entry.team!.name;
                tag = '[${entry.team!.tag}]';
                avatarUrl = entry.team!.avatarUrl;
              } else {
                name = entry.user.nickname;
                tag = null;
                avatarUrl = entry.user.avatarUrl;
              }

              return _buildParticipantCard(name, avatarUrl, tag, isTeamMode);
            },
          ),
          const SizedBox(height: 32),
        ],

        // ListView.separated(
        //   padding: EdgeInsets.zero,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: mockParticipants.length,
        //   scrollDirection: Axis.vertical,
        //   separatorBuilder: (context, index) => SizedBox(height: 16),
        //   itemBuilder: (context, index) {
        //     final participant = mockParticipants[index];
        //     return _buildParticipantCard(participant);
        //   },
        // ),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildParticipantCard(
    String name,
    String? avatarUrl,
    String? subTitle,
    bool isTeam,
  ) {
    return Container(
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
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl) : null,
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
    );

    // Widget _buildParticipantCard(Participant participant) {
    //   return Container(
    //     padding: EdgeInsets.all(16.0),
    //     decoration: BoxDecoration(
    //       color: AppColors.bgSurface,
    //       borderRadius: BorderRadius.circular(12.0),
    //     ),
    //     child: Row(
    //       children: [
    //         CircleAvatar(
    //           radius: 20,
    //           backgroundColor: AppColors.bgMain,
    //           backgroundImage: participant.avatarUrl != null
    //               ? NetworkImage(participant.avatarUrl!)
    //               : null,
    //           child: participant.avatarUrl == null
    //               ? const Icon(
    //                   LucideIcons.userRound,
    //                   color: AppColors.textSecondary,
    //                 )
    //               : null,
    //         ),
    //         const SizedBox(width: 12),
    //         Text(participant.name, style: AppTextStyles.nameParticipant),
    //       ],
    //     ),
    //   );
    // }
  }
}
