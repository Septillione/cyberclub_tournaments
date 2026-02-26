import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class TournamentFormatFields extends StatelessWidget {
  final Discipline discipline;
  final TeamMode teamMode;
  final BracketType bracketType;
  final int maxParticipants;
  final ValueChanged<Discipline> onDisciplineChanged;
  final ValueChanged<TeamMode> onTeamModeChanged;
  final ValueChanged<BracketType> onBracketTypeChanged;
  final ValueChanged<int> onMaxParticipantsChanged;

  const TournamentFormatFields({
    super.key,
    required this.discipline,
    required this.teamMode,
    required this.bracketType,
    required this.maxParticipants,
    required this.onDisciplineChanged,
    required this.onTeamModeChanged,
    required this.onBracketTypeChanged,
    required this.onMaxParticipantsChanged,
  });

  static const _participantsAmount = [4, 8, 16, 32, 64];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Игра и форматы', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        DropdownButtonFormField<Discipline>(
          initialValue: discipline,
          decoration: const InputDecoration(
            labelText: 'Игра',
            border: OutlineInputBorder(),
          ),
          items: Discipline.values
              .map((d) => DropdownMenuItem(value: d, child: Text(d.title)))
              .toList(),
          onChanged: (v) {
            if (v != null) onDisciplineChanged(v);
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<TeamMode>(
                initialValue: teamMode,
                decoration: const InputDecoration(
                  labelText: 'Режим',
                  border: OutlineInputBorder(),
                ),
                items: TeamMode.values
                    .map(
                      (v) => DropdownMenuItem(value: v, child: Text(v.title)),
                    )
                    .toList(),
                onChanged: (v) {
                  if (v != null) onTeamModeChanged(v);
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButtonFormField<int>(
                initialValue: maxParticipants,
                decoration: const InputDecoration(
                  labelText: 'Команд',
                  border: OutlineInputBorder(),
                ),
                items: _participantsAmount
                    .map((i) => DropdownMenuItem(value: i, child: Text('$i')))
                    .toList(),
                onChanged: (v) {
                  if (v != null) onMaxParticipantsChanged(v);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<BracketType>(
          initialValue: bracketType,
          decoration: const InputDecoration(
            labelText: 'Тип сетки',
            border: OutlineInputBorder(),
          ),
          items: BracketType.values
              .map((b) => DropdownMenuItem(value: b, child: Text(b.title)))
              .toList(),
          onChanged: (v) {
            if (v != null) onBracketTypeChanged(v);
          },
        ),
      ],
    );
  }
}
