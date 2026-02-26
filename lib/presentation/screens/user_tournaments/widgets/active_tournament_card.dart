import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class ActiveTournamentCard extends StatelessWidget {
  final TournamentEntity tournament;
  final String currentUserId;

  const ActiveTournamentCard({
    super.key,
    required this.tournament,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final myName = _getMyName(tournament, currentUserId);
    final nextMatch = _getNextMatch(tournament, myName);

    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 237,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(24),
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
            _NextMatchInfo(match: nextMatch, myName: myName),
          ],
        ),
      ),
    );
  }

  String _getMyName(TournamentEntity tournament, String userId) {
    // Здесь должна быть логика поиска имени участника
    // В текущей модели данных это сложно сделать без дополнительных запросов
    // или хранения имени в entry
    return 'Вы';
  }

  MatchEntity? _getNextMatch(TournamentEntity tournament, String myName) {
    // Упрощённая логика поиска следующего матча
    try {
      if (tournament.matches.isEmpty) return null;

      final matches = List<MatchEntity>.from(tournament.matches)
        ..sort((a, b) => a.round.compareTo(b.round));

      return matches.firstWhere(
        (m) =>
            (m.participant1 == myName || m.participant2 == myName) &&
            (m.score1 == 0 && m.score2 == 0),
        orElse: () => matches.last,
      );
    } catch (_) {
      return null;
    }
  }
}

class _NextMatchInfo extends StatelessWidget {
  final MatchEntity? match;
  final String myName;

  const _NextMatchInfo({required this.match, required this.myName});

  @override
  Widget build(BuildContext context) {
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

    String opponentName = match!.participant1 == myName
        ? (match!.participant2 ?? 'TBD')
        : (match!.participant1 ?? 'TBD');

    if (opponentName == 'TBD') opponentName = 'Ожидание...';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgMain,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.redColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Раунд ${match!.round}',
            style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _TeamItem(name: myName, isMe: true)),
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
              Expanded(child: _TeamItem(name: opponentName, isMe: false)),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamItem extends StatelessWidget {
  final String name;
  final bool isMe;

  const _TeamItem({required this.name, required this.isMe});

  @override
  Widget build(BuildContext context) {
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
