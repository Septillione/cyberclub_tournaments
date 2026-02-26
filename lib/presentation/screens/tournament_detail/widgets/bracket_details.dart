import 'dart:math' as math;
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/bloc/tournament_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tournament_bracket/flutter_tournament_bracket.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BracketDetails extends StatelessWidget {
  const BracketDetails({super.key});

  static const double cardWidth = 180.0;
  static const double cardHeight = 80.0;
  static const double gapWidth = 60.0;
  static const double gapHeight = 20.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
      builder: (context, state) {
        if (state is! TournamentDetailLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final rounds = state.bracketRounds;
        final isCreator = state.currentUserId == state.tournament.creatorId;
        final isFinished = state.tournament.status == TournamentStatus.finished;
        final canEdit = isCreator && !isFinished;

        if (rounds.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.network,
                  size: 64,
                  color: AppColors.textDisabled,
                ),
                const SizedBox(height: 16),
                Text(
                  'Сетка еще не сформирована',
                  style: AppTextStyles.h3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        int maxMatchesInColumn = 0;
        for (var round in rounds) {
          if ((round.matches.length ?? 0) > maxMatchesInColumn) {
            maxMatchesInColumn = round.matches.length;
          }
        }

        final double requiredWidth =
            (rounds.length * (cardWidth + gapWidth)) + 100;

        final double requiredHeight =
            (maxMatchesInColumn * (cardHeight + gapHeight * 2)) + 100;

        return LayoutBuilder(
          builder: (context, constraints) {
            final double finalWidth = math.max(
              requiredWidth,
              constraints.maxWidth,
            );
            final double finalHeight = math.max(
              requiredHeight,
              constraints.maxHeight,
            );

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: finalWidth,
                  height: finalHeight,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: TournamentBracket(
                    list: rounds,
                    lineColor: AppColors.accentPrimary,
                    cardWidth: cardWidth,
                    cardHeight: cardHeight,
                    card: (TournamentMatch item) =>
                        _buildMatchCard(item, context, canEdit),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMatchCard(
    TournamentMatch match,
    BuildContext context,
    bool canEdit,
  ) {
    return GestureDetector(
      onTap: () {
        if (!canEdit) return;
        if (match.teamA == 'TBD' || match.teamB == 'TBD') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Участники еще не определены")),
          );
          return;
        }
        _showScoreDialog(context, match);
      },

      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.bgMain, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTeamRow(match.teamA, match.scoreTeamA),
            const Divider(height: 15, thickness: 1, color: AppColors.bgMain),
            _buildTeamRow(match.teamB, match.scoreTeamB),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamRow(String? name, String? score) {
    final bool isPlaceholder = name == null || name == "TBD";
    final displayName = isPlaceholder ? "..." : name;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              displayName,
              style: AppTextStyles.caption.copyWith(
                color: isPlaceholder
                    ? AppColors.textDisabled
                    : AppColors.textPrimary,
                fontWeight: isPlaceholder ? FontWeight.normal : FontWeight.bold,
                fontSize: 11,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          if (!isPlaceholder)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
              decoration: BoxDecoration(
                color: AppColors.bgMain,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                score ?? "0",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.accentPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showScoreDialog(BuildContext context, TournamentMatch match) {
    final s1Controller = TextEditingController(text: match.scoreTeamA);
    final s2Controller = TextEditingController(text: match.scoreTeamB);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgSurface,
        title: const Text("Редактирование матча"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- Участник 1 ---
            Row(
              children: [
                Expanded(
                  child: Text(
                    match.teamA ?? "...",
                    style: AppTextStyles.bodyL,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: s1Controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Кнопка дисквалификации 1
                IconButton(
                  icon: const Icon(
                    LucideIcons.skull,
                    color: AppColors.redColor,
                  ),
                  tooltip: "Дисквалифицировать (Тех. поражение)",
                  onPressed: () => _confirmDisqualification(
                    context,
                    ctx,
                    match,
                    1,
                    match.teamA,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // --- Участник 2 ---
            Row(
              children: [
                Expanded(
                  child: Text(
                    match.teamB ?? "...",
                    style: AppTextStyles.bodyL,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: s2Controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Кнопка дисквалификации 2
                IconButton(
                  icon: const Icon(
                    LucideIcons.skull,
                    color: AppColors.redColor,
                  ),
                  tooltip: "Дисквалифицировать (Тех. поражение)",
                  onPressed: () => _confirmDisqualification(
                    context,
                    ctx,
                    match,
                    2,
                    match.teamB,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Отмена"),
          ),
          ElevatedButton(
            onPressed: () {
              // Обычное сохранение счета
              context.read<TournamentDetailBloc>().add(
                MatchScoreUpdated(
                  matchId: match.id,
                  score1: int.tryParse(s1Controller.text) ?? 0,
                  score2: int.tryParse(s2Controller.text) ?? 0,
                ),
              );
              Navigator.pop(ctx);
            },
            child: const Text("Сохранить счет"),
          ),
        ],
      ),
    );
  }

  void _confirmDisqualification(
    BuildContext parentContext,
    BuildContext dialogContext,
    TournamentMatch match,
    int loserPosition,
    String? teamName,
  ) {
    showDialog(
      context: dialogContext,
      builder: (ctx) => AlertDialog(
        title: const Text('Подтверждение'),
        content: Text(
          'Вы уверены, что хотите засчитать техническое поражение команде $teamName?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Нет"),
          ),
          TextButton(
            onPressed: () {
              parentContext.read<TournamentDetailBloc>().add(
                MatchDisqualified(
                  matchId: match.id,
                  loserPosition: loserPosition,
                ),
              );
              Navigator.pop(ctx);
              Navigator.pop(dialogContext);
            },
            child: const Text("Да, дисквалифицировать"),
          ),
        ],
      ),
    );
  }
}
