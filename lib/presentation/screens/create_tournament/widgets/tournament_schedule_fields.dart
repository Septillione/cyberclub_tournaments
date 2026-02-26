import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class TournamentScheduleFields extends StatelessWidget {
  final DateTime startDate;
  final TimeOfDay startTime;
  final bool isOnline;
  final TextEditingController addressController;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;
  final ValueChanged<bool> onOnlineChanged;

  const TournamentScheduleFields({
    super.key,
    required this.startDate,
    required this.startTime,
    required this.isOnline,
    required this.addressController,
    required this.onPickDate,
    required this.onPickTime,
    required this.onOnlineChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Проведение', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        _DateTimeRow(
          startDate: startDate,
          startTime: startTime,
          onPickDate: onPickDate,
          onPickTime: onPickTime,
        ),
        const SizedBox(height: 16),
        _OnlineOfflineChips(isOnline: isOnline, onChanged: onOnlineChanged),
        if (!isOnline) ...[
          const SizedBox(height: 16),
          TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
              labelText: 'Адрес места проведения',
              border: OutlineInputBorder(),
              prefixIcon: Icon(LucideIcons.locate),
            ),
            validator: (v) => (!isOnline && (v == null || v.isEmpty))
                ? 'Укажите адрес'
                : null,
          ),
        ],
      ],
    );
  }
}

class _DateTimeRow extends StatelessWidget {
  final DateTime startDate;
  final TimeOfDay startTime;
  final VoidCallback onPickDate;
  final VoidCallback onPickTime;

  const _DateTimeRow({
    required this.startDate,
    required this.startTime,
    required this.onPickDate,
    required this.onPickTime,
  });

  String get _formattedDate =>
      '${startDate.day}.${startDate.month}.${startDate.year}';

  String get _formattedTime =>
      '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onPickDate,
            icon: const Icon(LucideIcons.calendar),
            label: Text(_formattedDate),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onPickTime,
            icon: const Icon(LucideIcons.clock),
            label: Text(_formattedTime),
          ),
        ),
      ],
    );
  }
}

class _OnlineOfflineChips extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onChanged;

  const _OnlineOfflineChips({required this.isOnline, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Формат', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text('Онлайн'),
          selected: isOnline,
          onSelected: (_) => onChanged(true),
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text('Офлайн'),
          selected: !isOnline,
          onSelected: (_) => onChanged(false),
        ),
      ],
    );
  }
}
