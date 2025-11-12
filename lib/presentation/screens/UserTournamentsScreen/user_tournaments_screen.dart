import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/bloc/user_tournaments_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/active_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/finished_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/upcoming_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum CardType { active, upcoming, finished }

class UserTournamentsScreen extends StatefulWidget {
  const UserTournamentsScreen({super.key});

  @override
  State<UserTournamentsScreen> createState() => _UserTournamentsScreenState();
}

class _UserTournamentsScreenState extends State<UserTournamentsScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<UserTournamentsBloc, UserTournamentsState>(
                  builder: (context, state) {
                    if (state is UserTournamentsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is UserTournamentsError) {
                      return Center(
                        child: Text('Ошибка: ${state.errorMessage}'),
                      );
                    }
                    if (state is UserTournamentsLoaded) {
                      final List<Widget> segmentContents = [
                        _buildTournamentList(
                          state.activeTournaments,
                          CardType.active,
                        ),
                        _buildTournamentList(
                          state.upcomingTournaments,
                          CardType.upcoming,
                        ),
                        _buildTournamentList(
                          state.finishedTournaments,
                          CardType.finished,
                        ),
                      ];
                      return segmentContents[_selectedSegmentIndex];
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Мои турниры', style: AppTextStyles.h2),
        SizedBox(height: 16),
        SegmentedButtonDetails(
          segments: const ['Активные', 'Предстоящие', 'Завершенные'],
          initialIndex: _selectedSegmentIndex,
          onSegmentTapped: (index) {
            setState(() {
              _selectedSegmentIndex = index;
            });
          },
        ),
      ],
    );
  }

  Widget _buildTournamentList(
    List<TournamentModel> tournaments,
    CardType cardType,
  ) {
    if (tournaments.isEmpty) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.heartCrack200,
              color: AppColors.textDisabled,
              size: 64,
            ),
            const SizedBox(height: 8),
            Text('Здесь пока пусто', style: AppTextStyles.h3),
            const SizedBox(height: 16),
            Text(
              'Вы еще не участвуете ни в одном активном турнире.',
              style: AppTextStyles.button.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: tournaments.length,
      itemBuilder: (context, index) {
        final tournament = tournaments[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: switch (cardType) {
            CardType.active => ActiveTournamentCard(tournament: tournament),
            CardType.upcoming => UpcomingTournamentCard(tournament: tournament),
            CardType.finished => FinishedTournamentCard(
              tournament: tournament,
              place: '3-е',
            ),
          },
        );
      },
    );
  }
}
