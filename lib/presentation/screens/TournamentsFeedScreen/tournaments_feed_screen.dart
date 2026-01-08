import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_bottom_sheet.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_chip.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentsFeedScreen extends StatefulWidget {
  const TournamentsFeedScreen({super.key});

  @override
  State<TournamentsFeedScreen> createState() => _TournamentsFeedScreenState();
}

class _TournamentsFeedScreenState extends State<TournamentsFeedScreen> {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

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
        const TouranmentFeedSearchChanged(''),
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
          // bottom: false,
          child: BlocBuilder<TournamentsFeedBloc, TournamentsFeedState>(
            builder: (context, state) {
              TournamentFilter currentFilter = const TournamentFilter();
              if (state is TournamentsFeedLoaded) {
                currentFilter = state.currentFilter;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 16.0,
                    ),
                    child: _buildHeader(context),
                  ),

                  SizedBox(height: 24),

                  if (state is TournamentsFeedLoaded)
                    _buildFilter(context, state)
                  else
                    const SizedBox(height: 32),

                  const SizedBox(height: 24),

                  if (state is TournamentsFeedLoading)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const TournamentSkeletonCard();
                          },
                        ),
                      ),
                    )
                  else if (state is TournamentsFeedLoaded)
                    _buildTournaments(context, state)
                  else if (state is TournamentsFeedError)
                    Center(
                      child: Text(
                        'Ошибка: ${state.errorMessage}',
                        style: AppTextStyles.bodyL.copyWith(
                          color: AppColors.redColor,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSearchActive = !_isSearchActive;
                      });
                      if (!_isSearchActive) {
                        _searchController.clear();
                        context.read<TournamentsFeedBloc>().add(
                          TouranmentFeedSearchChanged(''),
                        );
                      }
                    },
                    child: Icon(
                      _isSearchActive ? LucideIcons.x : LucideIcons.search,
                      size: 24,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => context.push('/notifications'),
                    child: Icon(
                      LucideIcons.bell,
                      size: 24,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),

          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: _isSearchActive
                ? MediaQuery.of(context).size.width - 112
                : 0,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _isSearchActive
                  ? TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      autofocus: true,
                      style: AppTextStyles.bodyL,
                      decoration: const InputDecoration(
                        hintText: 'Поиск...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        context.read<TournamentsFeedBloc>().add(
                          TouranmentFeedSearchChanged(value),
                        );
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilter(BuildContext context, TournamentsFeedLoaded state) {
    final selectedDiscipline = state.currentFilter.discipline;
    List<Discipline> sortedDisciplines = List.from(Discipline.values);

    if (selectedDiscipline != null) {
      sortedDisciplines.remove(selectedDiscipline);
      sortedDisciplines.insert(0, selectedDiscipline);
    }

    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) => FilterBottomSheet(
                    currentFilter: state.currentFilter,
                    onApply: (newFilter) {
                      context.read<TournamentsFeedBloc>().add(
                        TournamentFilterUpdated(newFilter),
                      );
                    },
                  ),
                );
              },
              child: Icon(
                LucideIcons.slidersHorizontal,
                size: 32,
                color: state.currentFilter.isEmpty
                    ? AppColors.textSecondary
                    : AppColors.accentPrimary,
              ),
            ),
          ),

          SizedBox(width: 16.0),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 4.0),
              children: [
                GestureDetector(
                  onTap: () {
                    final newFilter = state.currentFilter.copyWith(
                      clearDiscipline: true,
                    );
                    context.read<TournamentsFeedBloc>().add(
                      TournamentFilterUpdated(newFilter),
                    );
                  },
                  child: FilterChipWidget(
                    label: 'Все игры',
                    isSelected: state.currentFilter.discipline == null,
                  ),
                ),

                ...sortedDisciplines.map((discipline) {
                  return GestureDetector(
                    onTap: () {
                      if (state.currentFilter.discipline == discipline) {
                        final newFilter = state.currentFilter.copyWith(
                          clearDiscipline: true,
                        );
                        context.read<TournamentsFeedBloc>().add(
                          TournamentFilterUpdated(newFilter),
                        );
                      } else {
                        final newFilter = state.currentFilter.copyWith(
                          discipline: discipline,
                        );
                        context.read<TournamentsFeedBloc>().add(
                          TournamentFilterUpdated(newFilter),
                        );
                      }
                    },
                    child: FilterChipWidget(
                      label: discipline.title,
                      isSelected: state.currentFilter.discipline == discipline,
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTournaments(BuildContext context, TournamentsFeedLoaded state) {
    if (state.tournaments.isEmpty) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.searchX300,
              color: AppColors.textDisabled,
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              'Турниров по этой дисциплине не найдено',
              style: AppTextStyles.bodyL,
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: LiquidPullToRefresh(
          color: AppColors.bgMain,
          backgroundColor: AppColors.accentPrimary,
          height: 60,
          animSpeedFactor: 5.0,
          showChildOpacityTransition: false,
          onRefresh: () async {
            final newFilter = state.currentFilter;
            context.read<TournamentsFeedBloc>().add(
              TournamentsFeedRefreshed(newFilter),
            );
            await Future.delayed(const Duration(seconds: 1));
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.tournaments.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final tournament = state.tournaments[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TournamentCard(tournament: tournament),
              );
            },
          ),
        ),
      ),
    );
  }
}
