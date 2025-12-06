import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/bloc/tournaments_feed_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/filter_chip.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentsFeedScreen extends StatelessWidget {
  const TournamentsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: BlocBuilder<TournamentsFeedBloc, TournamentsFeedState>(
            builder: (context, state) {
              switch (state) {
                case TournamentsFeedLoading():
                  return const Center(child: CircularProgressIndicator());
                case TournamentsFeedError():
                  return Center(
                    child: Text(
                      'Ошибка: ${state.errorMessage}',
                      style: AppTextStyles.bodyL.copyWith(
                        color: AppColors.statusError,
                      ),
                    ),
                  );
                case TournamentsFeedLoaded():
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      SizedBox(height: 16),
                      _buildFilter(context, state),
                      SizedBox(height: 24),
                      _buildTournaments(context, state),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('CyberClub', style: AppTextStyles.h2),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                print('Search is pressed!');
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
                print('Bell is pressed!');
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
    );
  }

  Widget _buildFilter(BuildContext context, TournamentsFeedLoaded state) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print('Filter is pressed!');
            },
            child: Icon(
              LucideIcons.slidersHorizontal,
              size: 32,
              color: AppColors.textSecondary,
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<TournamentsFeedBloc>().add(
                      const TournamentsFeedFilterChanged(null),
                    );
                  },
                  child: FilterChipWidget(
                    label: 'Все игры',
                    isSelected: state.selectedDiscipline == null,
                  ),
                ),

                ...state.disciplines.map((discipline) {
                  return GestureDetector(
                    onTap: () {
                      context.read<TournamentsFeedBloc>().add(
                        TournamentsFeedFilterChanged(discipline),
                      );
                    },
                    child: FilterChipWidget(
                      label: discipline.title,
                      isSelected: state.selectedDiscipline == discipline,
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
    if (state.filteredTournaments.isEmpty) {
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
          context.read<TournamentsFeedBloc>().add(TournamentsFeedRefreshed());
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: state.filteredTournaments.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final tournament = state.filteredTournaments[index];

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
