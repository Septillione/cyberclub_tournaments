import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class BanSetupDialog extends StatefulWidget {
  final String userName;
  final void Function(String reason, int? days) onConfirm;

  const BanSetupDialog({
    super.key,
    required this.userName,
    required this.onConfirm,
  });

  @override
  State<BanSetupDialog> createState() => _BanSetupDialogState();
}

class _BanSetupDialogState extends State<BanSetupDialog> {
  final _reasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? _selectedDays = 1;

  static const _banDurations = {
    '1 день': 1,
    '3 дня': 3,
    '1 неделя': 7,
    '1 месяц': 30,
    'Навсегда': null,
  };

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.bgSurface,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Бан пользователя ${widget.userName}',
                style: AppTextStyles.h3,
              ),
              const SizedBox(height: 16),
              Text('Причина:', style: AppTextStyles.bodyM),
              const SizedBox(height: 8),
              TextFormField(
                controller: _reasonController,
                style: AppTextStyles.bodyM,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Укажите причину';
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Оскорбление, читы...',
                  filled: true,
                  fillColor: AppColors.bgMain,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('Длительность:', style: AppTextStyles.bodyM),
              const SizedBox(height: 8),
              _DurationDropdown(
                selectedDays: _selectedDays,
                onChanged: (days) => setState(() => _selectedDays = days),
              ),
              const SizedBox(height: 24),
              _DialogButtons(
                onCancel: () => Navigator.pop(context),
                onConfirm: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onConfirm(_reasonController.text, _selectedDays);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DurationDropdown extends StatelessWidget {
  final int? selectedDays;
  final ValueChanged<int?> onChanged;

  const _DurationDropdown({
    required this.selectedDays,
    required this.onChanged,
  });

  static const _options = {
    '1 день': 1,
    '3 дня': 3,
    '1 неделя': 7,
    '1 месяц': 30,
    'Навсегда': null,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.bgMain,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int?>(
          value: selectedDays,
          isExpanded: true,
          dropdownColor: AppColors.bgMain,
          items: _options.entries
              .map(
                (e) => DropdownMenuItem(
                  value: e.value,
                  child: Text(e.key, style: AppTextStyles.bodyM),
                ),
              )
              .toList(),
          onChanged: (value) => onChanged(value),
        ),
      ),
    );
  }
}

class _DialogButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const _DialogButtons({required this.onCancel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.textSecondary),
            ),
            child: const Text(
              'Отмена',
              style: TextStyle(color: AppColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redColor,
            ),
            onPressed: onConfirm,
            child: const Text(
              'Забанить',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
