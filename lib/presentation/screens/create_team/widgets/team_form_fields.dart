import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController tagController;
  final TextEditingController descriptionController;
  final TextEditingController socialMediaController;

  const TeamFormFields({
    super.key,
    required this.nameController,
    required this.tagController,
    required this.descriptionController,
    required this.socialMediaController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NameTagRow(
          nameController: nameController,
          tagController: tagController,
        ),
        const SizedBox(height: 16),
        _DescriptionField(controller: descriptionController),
        const SizedBox(height: 16),
        _SocialMediaField(controller: socialMediaController),
      ],
    );
  }
}

class _NameTagRow extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController tagController;

  const _NameTagRow({
    required this.nameController,
    required this.tagController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: nameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Название',
              prefixIcon: Icon(LucideIcons.shield),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Введите название';
              if (value.length < 3) return 'Минимум 3 символа';
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextFormField(
            controller: tagController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Тег',
              prefixIcon: Icon(LucideIcons.tag),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Введите тег';
              if (value.length < 2) return 'Минимум 2 символа';
              return null;
            },
          ),
        ),
      ],
    );
  }
}

class _DescriptionField extends StatelessWidget {
  final TextEditingController controller;

  const _DescriptionField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 3,
      decoration: const InputDecoration(
        labelText: 'Описание',
        alignLabelWithHint: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Icon(LucideIcons.fileText),
        ),
      ),
      validator: (value) {
        if (value != null && value.length > 300) return 'Максимум 300 символов';
        return null;
      },
    );
  }
}

class _SocialMediaField extends StatelessWidget {
  final TextEditingController controller;

  const _SocialMediaField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Социальные сети',
        prefixIcon: Icon(LucideIcons.messageCircleHeart),
      ),
      validator: (value) {
        if (value != null && value.length > 50) return 'Максимум 50 символов';
        return null;
      },
    );
  }
}
