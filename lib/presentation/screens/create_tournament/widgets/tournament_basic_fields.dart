import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class TournamentBasicFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController rulesController;

  const TournamentBasicFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.rulesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Основное', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Название',
            border: OutlineInputBorder(),
          ),
          validator: (v) => v!.isEmpty ? 'Введите название' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Описание',
            border: OutlineInputBorder(),
          ),
          validator: (v) => v!.isEmpty ? 'Введите описание' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: rulesController,
          decoration: const InputDecoration(
            labelText: 'Правила',
            border: OutlineInputBorder(),
          ),
          validator: (v) => v!.isEmpty ? 'Введите правила' : null,
        ),
      ],
    );
  }
}
