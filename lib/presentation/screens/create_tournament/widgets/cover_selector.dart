import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class CoverSelector extends StatelessWidget {
  final Discipline discipline;
  final String selectedImageUrl;
  final ValueChanged<String> onImageSelected;
  final Map<Discipline, List<String>> presets;

  const CoverSelector({
    super.key,
    required this.discipline,
    required this.selectedImageUrl,
    required this.onImageSelected,
    required this.presets,
  });

  @override
  Widget build(BuildContext context) {
    final availableCovers = presets[discipline] ?? [];

    if (availableCovers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Обложка турнира', style: AppTextStyles.h3),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: availableCovers.length,
            itemBuilder: (context, index) {
              final url = availableCovers[index];
              return _CoverItem(
                url: url,
                isSelected: selectedImageUrl == url,
                onTap: () => onImageSelected(url),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CoverItem extends StatelessWidget {
  final String url;
  final bool isSelected;
  final VoidCallback onTap;

  const _CoverItem({
    required this.url,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 200,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: AppColors.accentPrimary, width: 3)
              : Border.all(color: Colors.transparent, width: 3),
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover,
            colorFilter: isSelected
                ? null
                : const ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: isSelected
            ? const Center(
                child: Icon(Icons.check_circle, color: Colors.white, size: 32),
              )
            : null,
      ),
    );
  }
}
