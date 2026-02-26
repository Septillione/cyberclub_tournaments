import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class PrizeInput {
  String label;
  String amount;

  PrizeInput({required this.label, required this.amount});
}

class PrizesSection extends StatelessWidget {
  final List<PrizeInput> prizes;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  const PrizesSection({
    super.key,
    required this.prizes,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Призовые места', style: AppTextStyles.h3),
        const SizedBox(height: 8),
        ...prizes.asMap().entries.map((entry) {
          return _PrizeRow(
            key: ValueKey('prize_${entry.key}'),
            prize: entry.value,
            onRemove: () => onRemove(entry.key),
          );
        }),
        TextButton.icon(
          onPressed: onAdd,
          icon: const Icon(LucideIcons.circlePlus),
          label: const Text('Добавить призовое место'),
        ),
      ],
    );
  }
}

class _PrizeRow extends StatelessWidget {
  final PrizeInput prize;
  final VoidCallback onRemove;

  const _PrizeRow({super.key, required this.prize, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: prize.label,
              decoration: const InputDecoration(
                labelText: 'Место',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => prize.label = v,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: prize.amount,
              decoration: const InputDecoration(
                labelText: 'Приз',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => prize.amount = v,
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: Icon(LucideIcons.trash, color: AppColors.redColor),
          ),
        ],
      ),
    );
  }
}
