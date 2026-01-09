import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ActiveTournamentCard extends StatelessWidget {
  final TournamentModel tournament;
  final String currentUserId;

  const ActiveTournamentCard({
    super.key,
    required this.tournament,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    print("DEBUG: ActiveTournamentCard build. ID: ${tournament.id}");

    String myName = 'Вы';
    try {
      final entry = tournament.entries.cast<TournamentEntryItem?>().firstWhere(
        (e) => e?.userId == currentUserId,
        orElse: () => null,
      );

      if (entry != null) {
        if (tournament.teamMode == TeamMode.solo) {
          myName = entry.user.nickname;
        } else {
          myName = entry.team?.name ?? 'Моя команда';
        }
      }
    } catch (e, stack) {
      print("ERROR finding entry: $e");
      print(stack);
    }

    MatchModel? nextMatch;
    try {
      if (tournament.matches.isNotEmpty) {
        final sortedMatches = List<MatchModel>.from(tournament.matches)
          ..sort((a, b) => a.round.compareTo(b.round));

        nextMatch = sortedMatches.firstWhere(
          (m) =>
              (m.participant1 == myName || m.participant2 == myName) &&
              (m.score1 == 0 && m.score2 == 0),
          orElse: () => sortedMatches.last,
        );
        if ((nextMatch.score1 != 0 || nextMatch.score2 != 0)) {
          nextMatch = null;
        }
      }
    } catch (e) {
      print("ERROR finding match: $e");
    }

    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        height: 237,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tournament.title,
              style: AppTextStyles.h3,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              '${tournament.discipline.title}, ${tournament.teamMode.title}, ${tournament.bracketType.title}',
              style: AppTextStyles.bodyM,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            const SizedBox(height: 16),
            _buildNextMatchInfo(nextMatch, myName),
          ],
        ),
      ),
    );
  }

  Widget _buildNextMatchInfo(MatchModel? match, String myName) {
    if (match == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.hourglass, color: AppColors.textSecondary),
            SizedBox(height: 8),
            Text("Ожидание соперника...", style: AppTextStyles.caption),
          ],
        ),
      );
    }

    String opponentName = match.participant1 == myName
        ? (match.participant2 ?? 'TBD')
        : (match.participant1 ?? 'TBD');

    if (opponentName == 'TBD') opponentName = 'Ожидание...';

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgMain,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.redColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Раунд ${match.round}',
            style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildTeam(myName, isMe: true)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'VS',
                  style: AppTextStyles.bodyM.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDisabled,
                  ),
                ),
              ),
              Expanded(child: _buildTeam(opponentName, isMe: false)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeam(String name, {required bool isMe}) {
    return Column(
      children: [
        Icon(
          isMe ? LucideIcons.user : LucideIcons.swords,
          size: 32,
          color: isMe ? AppColors.accentPrimary : AppColors.textSecondary,
        ),
        const SizedBox(height: 4),
        Text(
          isMe ? 'Вы' : name,
          style: AppTextStyles.bodyM.copyWith(
            fontWeight: isMe ? FontWeight.bold : FontWeight.normal,
            color: AppColors.textPrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
