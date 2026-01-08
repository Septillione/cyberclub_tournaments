import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/bloc/user_tournaments_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/active_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/finished_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTournamentsScreen/widgets/upcoming_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

enum CardType { active, upcoming, finished }

class UserTournamentsScreen extends StatefulWidget {
  const UserTournamentsScreen({super.key});

  @override
  State<UserTournamentsScreen> createState() => _UserTournamentsScreenState();
}

class _UserTournamentsScreenState extends State<UserTournamentsScreen> {
  final int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Мои турниры', style: AppTextStyles.h2),
              SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<UserTournamentsBloc, UserTournamentsState>(
                  builder: (context, state) {
                    if (state is UserTournamentsLoading) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const TournamentSkeletonCard();
                        },
                      );
                    }
                    if (state is UserTournamentsError) {
                      return Center(
                        child: Text('Ошибка: ${state.errorMessage}'),
                      );
                    }
                    if (state is UserTournamentsLoaded) {
                      return LiquidPullToRefresh(
                        color: AppColors.bgMain,
                        backgroundColor: AppColors.accentPrimary,
                        height: 60,
                        animSpeedFactor: 5.0,
                        showChildOpacityTransition: false,
                        onRefresh: () async {
                          context.read<UserTournamentsBloc>().add(
                            UserTournamentsRefreshed(),
                          );
                          await Future.delayed(const Duration(seconds: 1));
                        },
                        child: _buildUserTournaments(
                          state.activeTournaments,
                          state.upcomingTournaments,
                          state.finishedTournaments,
                          state.currentUserId,
                        ),
                      );
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

  Widget _buildUserTournaments(
    List<TournamentModel> activeTournaments,
    List<TournamentModel> upcomingTournaments,
    List<TournamentModel> finishedTournaments,
    String currentUserId,
  ) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Text('Активные', style: AppTextStyles.bodyL),
        const SizedBox(height: 16),
        if (activeTournaments.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Нет активных турниров',
                style: TextStyle(color: AppColors.textDisabled),
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Row(
              children: activeTournaments.map((tournament) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 320,
                    child: ActiveTournamentCard(
                      tournament: tournament,
                      currentUserId: currentUserId,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        // SizedBox(
        //   height: 250,
        //   child: ListView.builder(
        //     itemCount: activeTournaments.length,
        //     itemBuilder: (context, index) {
        //       final tournament = activeTournaments[index];
        //       print(
        //         "DEBUG: Rendering tournament ${tournament.id}, matches: ${tournament.matches.length}",
        //       ); // <---

        //       return Container(
        //         margin: const EdgeInsets.only(right: 8.0),
        //         child: ActiveTournamentCard(
        //           tournament: tournament,
        //           currentUserId: currentUserId,
        //         ),
        //       );
        //     },
        //     scrollDirection: Axis.horizontal,
        //   ),
        // ),
        const SizedBox(height: 24),

        Text('Предстоящие', style: AppTextStyles.bodyL),
        const SizedBox(height: 16),
        if (upcomingTournaments.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Нет предстоящих турниров',
                style: TextStyle(color: AppColors.textDisabled),
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Row(
              children: upcomingTournaments.map((tournament) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 320,
                    child: UpcomingTournamentCard(
                      tournament: tournament,
                      currentUserId: currentUserId,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        // SizedBox(
        //   height: 168,
        //   child: ListView.builder(
        //     itemCount: upcomingTournaments.length,
        //     itemBuilder: (context, index) {
        //       final tournament = upcomingTournaments[index];
        //       return Container(
        //         width: 319,
        //         margin: const EdgeInsets.only(right: 8.0),
        //         child: UpcomingTournamentCard(tournament: tournament),
        //       );
        //     },
        //     scrollDirection: Axis.horizontal,
        //   ),
        // ),
        const SizedBox(height: 24),

        Text('Завершенные', style: AppTextStyles.bodyL),
        const SizedBox(height: 16),
        if (finishedTournaments.isEmpty)
          Center(child: Text('Нет завершенных турниров'))
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Row(
              children: finishedTournaments.map((tournament) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 320,
                    child: FinishedTournamentCard(
                      tournament: tournament,
                      currentUserId: currentUserId,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        // SizedBox(
        //   height: 160,
        //   child: ListView.builder(
        //     itemCount: finishedTournaments.length,
        //     itemBuilder: (context, index) {
        //       final tournament = finishedTournaments[index];
        //       return Container(
        //         width: 300,
        //         margin: const EdgeInsets.only(right: 8.0),
        //         child: FinishedTournamentCard(tournament: tournament),
        //       );
        //     },
        //     scrollDirection: Axis.horizontal,
        //   ),
        // ),
      ],
    );
  }
}
