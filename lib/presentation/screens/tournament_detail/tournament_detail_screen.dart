import 'package:cyberclub_tournaments/domain/usecases/team/fetch_user_teams_usecase.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/participant_details.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/bloc/tournament_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/general_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/bracket_details.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';

class TournamentDetailScreen extends StatelessWidget {
  final String tournamentId;

  const TournamentDetailScreen({super.key, required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<TournamentDetailBloc>()
            ..add(TournamentDetailStarted(tournamentId)),
      child: const _TournamentDetailView(),
    );
  }
}

class _TournamentDetailView extends StatefulWidget {
  const _TournamentDetailView();

  @override
  State<_TournamentDetailView> createState() => _TournamentDetailViewState();
}

class _TournamentDetailViewState extends State<_TournamentDetailView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
      builder: (context, state) {
        return switch (state) {
          TournamentDetailLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          TournamentDetailError(:final errorMessage) => Center(
            child: Text(errorMessage),
          ),
          TournamentDetailLoaded(:final tournament, :final currentUserId) =>
            Scaffold(
              extendBodyBehindAppBar: true,
              floatingActionButton: _ActionButton(
                tournament: tournament,
                currentUserId: currentUserId,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              body: Column(
                children: [
                  _HeaderImage(tournament: tournament),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.bgMain,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SegmentedButtonDetails(
                              segments: const ['Общее', 'Участники', 'Сетка'],
                              initialIndex: _selectedTab,
                              onSegmentTapped: (i) =>
                                  setState(() => _selectedTab = i),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(
                                20,
                                0,
                                20,
                                100,
                              ),
                              child: _Content(
                                index: _selectedTab,
                                tournament: tournament,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final TournamentEntity tournament;

  const _HeaderImage({required this.tournament});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(tournament.imageUrl, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.bgMain, Colors.transparent],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomBackButton(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    tournament.title,
                    style: AppTextStyles.h1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final int index;
  final TournamentEntity tournament;

  const _Content({required this.index, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return switch (index) {
      0 => GeneralDetails(tournament: tournament),
      1 => ParticipantsDetails(tournament: tournament),
      2 => const BracketDetails(),
      _ => const SizedBox.shrink(),
    };
  }
}

class _ActionButton extends StatelessWidget {
  final TournamentEntity tournament;
  final String currentUserId;

  const _ActionButton({required this.tournament, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    final isCreator = tournament.creatorId == currentUserId;

    if (tournament.status == TournamentStatus.registrationOpen) {
      if (isCreator) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.read<TournamentDetailBloc>().add(
                TournamentStartRequested(),
              ),
              child: const Text('Запустить'),
            ),
            const SizedBox(height: 8),
            GradientButton(
              text: 'Участвовать',
              onPressed: () => _join(context),
            ),
          ],
        );
      }
      return GradientButton(
        text: 'Участвовать',
        onPressed: () => _join(context),
      );
    }
    return const SizedBox.shrink();
  }

  void _join(BuildContext context) async {
    if (tournament.teamMode == TeamMode.solo) {
      context.read<TournamentDetailBloc>().add(
        const TournamentRegisterRequested(),
      );
    } else {
      final teams = await serviceLocator<FetchUserTeamsUsecase>()();
      if (context.mounted) {
        _showTeamSelector(context, teams);
      }
    }
  }

  void _showTeamSelector(BuildContext context, List<TeamEntity> teams) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Выберите команду'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: teams.length,
            itemBuilder: (context, index) {
              final team = teams[index];
              return ListTile(
                title: Text(team.name),
                onTap: () {
                  Navigator.pop(ctx);
                  // Здесь логика выбора состава через RosterDialog
                  // ...
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
