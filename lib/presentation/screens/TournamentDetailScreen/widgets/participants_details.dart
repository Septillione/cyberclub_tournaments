import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    final List<Participant> mockParticipants = List.generate(
      tournament.currentParticipants,
      (index) {
        return Participant(
          id: '$index',
          name: 'Player ${index + 1}',
          avatarUrl: 'https://i.pravatar.cc/150?u=$index',
        );
      },
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Участники: ${tournament.currentParticipants}/${tournament.maxParticipants}',
          style: AppTextStyles.h3,
        ),
        SizedBox(height: 24,),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mockParticipants.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final participant = mockParticipants[index];
            return _buildParticipantCard(participant);
          },
        ),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildParticipantCard(Participant participant) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.bgMain,
            backgroundImage: participant.avatarUrl != null
                ? NetworkImage(participant.avatarUrl!)
                : null,
            child: participant.avatarUrl == null
                ? const Icon(LucideIcons.user, color: AppColors.textSecondary)
                : null,
          ),
          const SizedBox(width: 12),
          Text(participant.name, style: AppTextStyles.nameParticipant),
        ],
      ),
    );
  }
}
