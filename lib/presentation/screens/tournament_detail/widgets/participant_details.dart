import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class ParticipantsDetails extends StatelessWidget {
  final TournamentEntity tournament;

  const ParticipantsDetails({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    final entries = tournament.entries;
    final isTeam = tournament.teamMode != TeamMode.solo;

    return Column(
      children: [
        if (entries.isEmpty)
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Пока нет участников'),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return _ParticipantCard(
                name: isTeam
                    ? 'Команда ${entry.teamId}'
                    : 'Игрок ${entry.userId}',
                // Здесь нужно подтянуть реальные имена
                // В API `entries` должны возвращать `team` или `user` object
                // Пока оставил заглушку
                avatarUrl: null,
                onTap: () {},
              );
            },
          ),
      ],
    );
  }
}

class _ParticipantCard extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final VoidCallback onTap;

  const _ParticipantCard({
    required this.name,
    this.avatarUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.bgMain,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : null,
              child: avatarUrl == null
                  ? const Icon(LucideIcons.user, color: AppColors.textSecondary)
                  : null,
            ),
            const SizedBox(width: 12),
            Text(name, style: AppTextStyles.bodyL),
          ],
        ),
      ),
    );
  }
}
