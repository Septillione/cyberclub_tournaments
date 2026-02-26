import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class GamesSelector extends StatelessWidget {
  final List<Discipline> selectedGames;
  final ValueChanged<Discipline> onGameToggled;

  const GamesSelector({
    super.key,
    required this.selectedGames,
    required this.onGameToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Игры', style: AppTextStyles.h3),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: Discipline.values
              .map(
                (game) => _GameChip(
                  game: game,
                  isSelected: selectedGames.contains(game),
                  onTap: () => onGameToggled(game),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _GameChip extends StatelessWidget {
  final Discipline game;
  final bool isSelected;
  final VoidCallback onTap;

  const _GameChip({
    required this.game,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(game.title),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: AppColors.bgSurface,
      selectedColor: AppColors.bgSurface,
      checkmarkColor: AppColors.accentPrimary,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.accentPrimary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? AppColors.accentPrimary : Colors.transparent,
        ),
      ),
    );
  }
}
