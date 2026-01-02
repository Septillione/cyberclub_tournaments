import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/FilterModel/filter_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_bottom_sheet.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_chip.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentsFeedScreen extends StatefulWidget {
  const TournamentsFeedScreen({super.key});

  @override
  State<TournamentsFeedScreen> createState() => _TournamentsFeedScreenState();
}

class _TournamentsFeedScreenState extends State<TournamentsFeedScreen> {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: BlocBuilder<TournamentsFeedBloc, TournamentsFeedState>(
            builder: (context, state) {
              TournamentFilter currentFilter = const TournamentFilter();
              if (state is TournamentsFeedLoaded) {
                currentFilter = state.currentFilter;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  SizedBox(height: 16),

                  if (state is TournamentsFeedLoaded)
                    _buildFilter(context, state)
                  else
                    const SizedBox(height: 32),

                  const SizedBox(height: 24),

                  if (state is TournamentsFeedLoading)
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (state is TournamentsFeedLoaded)
                    _buildTournaments(context, state)
                  else if (state is TournamentsFeedError)
                    Center(
                      child: Text(
                        'Ошибка: ${state.errorMessage}',
                        style: AppTextStyles.bodyL.copyWith(
                          color: AppColors.statusError,
                        ),
                      ),
                    ),
                ],
              );

              // switch (state) {
              //   case TournamentsFeedLoading():
              //     return const Center(child: CircularProgressIndicator());
              //   case TournamentsFeedError():
              //     return Center(
              //       child: Text(
              //         'Ошибка: ${state.errorMessage}',
              //         style: AppTextStyles.bodyL.copyWith(
              //           color: AppColors.statusError,
              //         ),
              //       ),
              //     );
              //   case TournamentsFeedLoaded():
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         _buildHeader(),
              //         SizedBox(height: 16),
              //         _buildFilter(context, state),
              //         SizedBox(height: 24),
              //         _buildTournaments(context, state),
              //       ],
              //     );
              // }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_isSearchActive)
            Expanded(
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Поиск турнира...',
                  border: InputBorder.none,
                  hintStyle: AppTextStyles.bodyL.copyWith(
                    color: AppColors.textDisabled,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                style: AppTextStyles.h3,
                onChanged: (value) {
                  context.read<TournamentsFeedBloc>().add(
                    TouranmentFeedSearchChanged(value),
                  );
                },
              ),
            )
          else
            Text('CyberClub', style: AppTextStyles.h2),
          Row(
            children: [
              if (_isSearchActive)
                GestureDetector(
                  onTap: () {
                    print('Search is pressed!');
                    setState(() {
                      _isSearchActive = false;
                      _searchController.clear();
                    });
                    context.read<TournamentsFeedBloc>().add(
                      const TouranmentFeedSearchChanged(''),
                    );
                  },
                  child: Icon(
                    LucideIcons.search,
                    size: 24,
                    color: AppColors.textSecondary,
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSearchActive = true;
                    });
                  },
                  child: Icon(
                    LucideIcons.search,
                    size: 24,
                    color: AppColors.textSecondary,
                  ),
                ),

              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  context.push('/notifications');
                },
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
    );
  }

  Widget _buildFilter(BuildContext context, TournamentsFeedLoaded state) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          GestureDetector(
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
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
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

                ...Discipline.values.map((discipline) {
                  return GestureDetector(
                    onTap: () {
                      final newFilter = state.currentFilter.copyWith(
                        discipline: discipline,
                      );
                      context.read<TournamentsFeedBloc>().add(
                        TournamentFilterUpdated(newFilter),
                      );
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
      child: RefreshIndicator(
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
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TournamentCard(tournament: tournament),
            );
          },
        ),
      ),
    );
  }
}
