import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
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

  final List<int> participants = [4, 8, 16, 32, 64];
  final bool? isOnline = true;

  @override
  void initState() {
    super.initState();
    _tempFilter = widget.currentFilter;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            // 1. Drag Handle (Полоска)
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 2. Заголовок и Сброс
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Фильтры', style: AppTextStyles.h2),
                  TextButton(
                    onPressed: () =>
                        setState(() => _tempFilter = const TournamentFilter()),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.redColor,
                    ),
                    child: const Text('Сбросить'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 3. Контент (скроллируемый, если экран маленький)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Сортировка'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildChip(
                          label: 'Сначала новые',
                          isSelected:
                              _tempFilter.sortOrder == TournamentSort.newest,
                          onSelected: (sel) => setState(() {
                            _tempFilter = _tempFilter.copyWith(
                              sortOrder: sel ? TournamentSort.newest : null,
                              clearSortOrder: !sel,
                            );
                          }),
                        ),
                        _buildChip(
                          label: 'Сначала старые',
                          isSelected:
                              _tempFilter.sortOrder == TournamentSort.oldest,
                          onSelected: (sel) => setState(() {
                            _tempFilter = _tempFilter.copyWith(
                              sortOrder: sel ? TournamentSort.oldest : null,
                              clearSortOrder: !sel,
                            );
                          }),
                        ),
                        _buildChip(
                          label: 'Популярные',
                          isSelected:
                              _tempFilter.sortOrder == TournamentSort.popular,
                          onSelected: (sel) => setState(() {
                            _tempFilter = _tempFilter.copyWith(
                              sortOrder: sel ? TournamentSort.popular : null,
                              clearSortOrder: !sel,
                            );
                          }),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('Дисциплина'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: Discipline.values
                          .map(
                            (d) => _buildChip(
                              label: d.title,
                              isSelected: _tempFilter.discipline == d,
                              onSelected: (sel) => setState(
                                () => _tempFilter = _tempFilter.copyWith(
                                  discipline: d,
                                  clearDiscipline: !sel,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('Статус'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: TournamentStatus.values
                          .map(
                            (s) => _buildChip(
                              label: s.title,
                              isSelected: _tempFilter.status == s,
                              onSelected: (sel) => setState(
                                () => _tempFilter = _tempFilter.copyWith(
                                  status: s,
                                  clearStatus: !sel,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('Режим'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: TeamMode.values
                          .map(
                            (m) => _buildChip(
                              label: m.title,
                              isSelected: _tempFilter.teamMode == m,
                              onSelected: (sel) => setState(
                                () => _tempFilter = _tempFilter.copyWith(
                                  teamMode: m,
                                  clearTeamMode: !sel,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    const SizedBox(height: 24),
                    _buildSectionTitle('Место проведения'),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildChip(
                          label: 'Онлайн',
                          isSelected: _tempFilter.isOnline == true,
                          onSelected: (sel) => setState(() {
                            _tempFilter = _tempFilter.copyWith(
                              isOnline: sel ? true : null,
                              clearIsOnline: !sel,
                            );
                          }),
                        ),
                        _buildChip(
                          label: 'Оффлайн',
                          isSelected: _tempFilter.isOnline == false,
                          onSelected: (sel) => setState(() {
                            _tempFilter = _tempFilter.copyWith(
                              isOnline: sel ? false : null,
                              clearIsOnline: !sel,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // 4. Кнопка Применить (Прибита к низу)
            Padding(
              padding: const EdgeInsets.all(20),
              child: GradientButton(
                text: 'Применить',
                onPressed: () {
                  widget.onApply(_tempFilter);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(title, style: AppTextStyles.h3.copyWith(fontSize: 18)),
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
      showCheckmark: false,
      backgroundColor: AppColors.bgMain,
      selectedColor: AppColors.accentPrimary.withOpacity(0.2),
      labelStyle: AppTextStyles.bodyM.copyWith(
        color: isSelected ? AppColors.accentPrimary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.accentPrimary : Colors.transparent,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    );
  }
}
