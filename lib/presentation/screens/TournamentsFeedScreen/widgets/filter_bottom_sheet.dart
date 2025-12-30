import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final TournamentFilter currentFilter;
  final Function(TournamentFilter) onApply;

  const FilterBottomSheet({
    super.key,
    required this.currentFilter,
    required this.onApply,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late TournamentFilter _tempFilter;

  @override
  void initState() {
    super.initState();
    _tempFilter = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Фильтры', style: AppTextStyles.h2),
              TextButton(
                onPressed: () {
                  setState(() {
                    _tempFilter = const TournamentFilter(); // Сброс
                  });
                },
                child: const Text('Сбросить'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          _buildSectionTitle('Дисциплина'),
          Wrap(
            spacing: 8,
            children: Discipline.values.map((d) {
              return _buildChip(
                label: d.title,
                isSelected: _tempFilter.discipline == d,
                onSelected: (selected) {
                  setState(() {
                    _tempFilter = _tempFilter.copyWith(
                      discipline: d,
                      clearDiscipline: !selected,
                    );
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
          _buildSectionTitle('Статус'),
          Wrap(
            spacing: 8,
            children: TournamentStatus.values.map((s) {
              return _buildChip(
                label: s.name,
                isSelected: _tempFilter.status == s,
                onSelected: (selected) {
                  setState(() {
                    _tempFilter = _tempFilter.copyWith(
                      status: s,
                      clearStatus: !selected,
                    );
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
          _buildSectionTitle('Режим'),
          Wrap(
            spacing: 8,
            children: TeamMode.values.map((m) {
              return _buildChip(
                label: m.title,
                isSelected: _tempFilter.teamMode == m,
                onSelected: (selected) {
                  setState(() {
                    _tempFilter = _tempFilter.copyWith(
                      teamMode: m,
                      clearTeamMode: !selected,
                    );
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onApply(_tempFilter);
                Navigator.pop(context);
              },
              child: const Text('Применить'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: AppTextStyles.h3),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required Function(bool) onSelected,
  }) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: AppColors.bgMain,
      selectedColor: AppColors.accentPrimary,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppColors.textSecondary,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide.none,
    );
  }
}
