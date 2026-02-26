import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/filter_bottom_sheet.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/filter_chip_widget.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/tournament_card.dart';

class TournamentsFeedScreen extends StatelessWidget {
  const TournamentsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<TournamentsFeedBloc>()..add(TournamentsFeedStarted()),
      child: const _TournamentsFeedView(),
    );
  }
}

class _TournamentsFeedView extends StatefulWidget {
  const _TournamentsFeedView();

  @override
  State<_TournamentsFeedView> createState() => _TournamentsFeedViewState();
}

class _TournamentsFeedViewState extends State<_TournamentsFeedView> {
  bool _isSearchActive = false;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _closeSearch() {
    if (_isSearchActive) {
      setState(() {
        _isSearchActive = false;
        _searchController.clear();
      });
      _focusNode.unfocus();
      context.read<TournamentsFeedBloc>().add(
        const TournamentSearchChanged(''),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _closeSearch,
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: BlocBuilder<TournamentsFeedBloc, TournamentsFeedState>(
            builder: (context, state) {
              return Column(
                children: [
                  _Header(
                    isSearchActive: _isSearchActive,
                    controller: _searchController,
                    focusNode: _focusNode,
                    onSearchToggle: () =>
                        setState(() => _isSearchActive = !_isSearchActive),
                    onSearchChanged: (v) => context
                        .read<TournamentsFeedBloc>()
                        .add(TournamentSearchChanged(v)),
                  ),
                  const SizedBox(height: 24),
                  if (state is TournamentsFeedLoaded)
                    _Filters(currentFilter: state.currentFilter)
                  else
                    const SizedBox(height: 32),
                  const SizedBox(height: 24),
                  Expanded(child: _Content(state: state)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isSearchActive;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSearchToggle;
  final ValueChanged<String> onSearchChanged;

  const _Header({
    required this.isSearchActive,
    required this.controller,
    required this.focusNode,
    required this.onSearchToggle,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: SizedBox(
        height: 40,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CyberClub', style: AppTextStyles.h2),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isSearchActive ? LucideIcons.x : LucideIcons.search,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () {
                        onSearchToggle();
                        if (!isSearchActive) controller.clear();
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        LucideIcons.bell,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: () => context.push('/notifications'),
                    ),
                  ],
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSearchActive
                  ? MediaQuery.of(context).size.width - 112
                  : 0,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isSearchActive
                  ? TextField(
                      controller: controller,
                      focusNode: focusNode,
                      autofocus: true,
                      style: AppTextStyles.bodyL,
                      decoration: const InputDecoration(
                        hintText: 'Поиск...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                      ),
                      onChanged: onSearchChanged,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  final TournamentFilter currentFilter;

  const _Filters({required this.currentFilter});

  @override
  Widget build(BuildContext context) {
    final disciplines = [null, ...Discipline.values];

    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () => _showFilterSheet(context),
              child: Icon(
                LucideIcons.slidersHorizontal,
                size: 32,
                color: currentFilter.hasActiveFilters
                    ? AppColors.accentPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: disciplines.length,
              itemBuilder: (context, index) {
                final d = disciplines[index];
                return FilterChipWidget(
                  label: d?.title ?? 'Все игры',
                  isSelected: currentFilter.discipline == d,
                  onTap: () {
                    context.read<TournamentsFeedBloc>().add(
                      TournamentFilterUpdated(
                        currentFilter.copyWith(
                          discipline: d,
                          clearDiscipline: d == null,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (_) => FilterBottomSheet(
        currentFilter: currentFilter,
        onApply: (f) =>
            context.read<TournamentsFeedBloc>().add(TournamentFilterUpdated(f)),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final TournamentsFeedState state;

  const _Content({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: switch (state) {
        TournamentsFeedLoading() => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, __) => const TournamentSkeletonCard(),
        ),
        TournamentsFeedError(:final errorMessage) => Center(
          child: Text(
            'Ошибка: $errorMessage',
            style: const TextStyle(color: AppColors.redColor),
          ),
        ),
        TournamentsFeedLoaded(:final tournaments) =>
          tournaments.isEmpty
              ? const _EmptyState()
              : _TournamentsList(tournaments: tournaments),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _TournamentsList extends StatelessWidget {
  final List<TournamentEntity> tournaments;

  const _TournamentsList({required this.tournaments});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: AppColors.bgMain,
      backgroundColor: AppColors.accentPrimary,
      height: 60,
      showChildOpacityTransition: false,
      onRefresh: () async {
        context.read<TournamentsFeedBloc>().add(
          // Здесь можно передать текущий фильтр если нужно
          const TournamentsFeedRefreshed(TournamentFilter()),
        );
      },
      child: ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TournamentCard(tournament: tournaments[index]),
          );
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.searchX,
            size: 48,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: 8),
          Text(
            'Турниры не найдены',
            style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
