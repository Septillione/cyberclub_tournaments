import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class BanSetupDialog extends StatefulWidget {
  final String userName;
  final Function(String reason, int? days) onConfirm;

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

  // Варианты бана. Value = количество дней (null = навсегда)
  final Map<String, int?> _banDurations = {
    '1 час':
        null, // Логику часов нужно допилить на бэке, пока пусть будет днями или используйте дробные если бэк поддерживает
    '1 день': 1,
    '3 дня': 3,
    '1 неделя': 7,
    '1 месяц': 30,
    'Навсегда': null,
  };

  int? _selectedDays = 1; // По умолчанию 1 день

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.bgSurface,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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

              // Поле ввода причины
              Text('Причина:', style: AppTextStyles.bodyM),
              const SizedBox(height: 8),
              TextFormField(
                controller: _reasonController,
                style: AppTextStyles.bodyM,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Укажите причину';
                  }
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

              // Выбор длительности
              Text('Длительность:', style: AppTextStyles.bodyM),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.bgMain,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int?>(
                    value: _selectedDays,
                    isExpanded: true,
                    dropdownColor: AppColors.bgMain,
                    items: _banDurations.entries.map((entry) {
                      return DropdownMenuItem<int?>(
                        value: entry.value,
                        child: Text(entry.key, style: AppTextStyles.bodyM),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDays = value;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Кнопки
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.textSecondary),
                      ),
                      child: Text(
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onConfirm(
                            _reasonController.text,
                            _selectedDays,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Забанить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
