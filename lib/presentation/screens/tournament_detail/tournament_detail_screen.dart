import 'package:cyberclub_tournaments/core/utils/image_provider_helper.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/participant_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/roster_selection_dialog.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/segmented_button_details.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/tournament_skeleton_card.dart';
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

  void _showTeamSelector(
    BuildContext context,
    TournamentEntity tournament,
    List<TeamEntity> teams,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        if (teams.isEmpty) {
          return AlertDialog(
            title: const Text('Нет команд'),
            content: const Text('Создайте команду, чтобы участвовать.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('ОК'),
              ),
            ],
          );
        }

        return AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: const Text('Выберите команду'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) => const Divider(),
              itemCount: teams.length,
              itemBuilder: (_, index) {
                final team = teams[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: team.avatarUrl != null
                        ? NetworkImage(team.avatarUrl!)
                        : null,
                  ),
                  title: Text(team.name, style: AppTextStyles.bodyL),
                  subtitle: Text(team.tag, style: AppTextStyles.caption),
                  onTap: () async {
                    Navigator.pop(dialogContext);
                    final requiredCount = switch (tournament.teamMode) {
                      TeamMode.duo => 2,
                      TeamMode.squad => 4,
                      TeamMode.team5v5 => 5,
                      _ => 1,
                    };

                    final List<String>? rosterIds =
                        await showDialog<List<String>>(
                          context: context,
                          builder: (_) => RosterSelectionDialog(
                            teamId: team.id,
                            requiredCount: requiredCount,
                          ),
                        );

                    if (rosterIds != null) {
                      context.read<TournamentDetailBloc>().add(
                        TournamentRegisterRequested(
                          teamId: team.id,
                          rosterIds: rosterIds,
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Отмена'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TournamentDetailBloc, TournamentDetailState>(
      listenWhen: (previous, current) =>
          current is TeamSelectionLoaded || current is TeamSelectionError,
      listener: (context, state) {
        if (state is TeamSelectionLoaded) {
          _showTeamSelector(context, state.tournament, state.userTeams);
        }

        if (state is TeamSelectionError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton:
            BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
              builder: (context, state) {
                final tournament = _getTournament(state);
                final currentUserId = _getCurrentUserId(state);

                if (tournament != null && currentUserId != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: _ActionButton(
                      tournament: tournament,
                      currentUserId: currentUserId,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
          builder: (context, state) {
            final tournament = _getTournament(state);
            final currentUserId = _getCurrentUserId(state);

            if (tournament == null || currentUserId == null) {
              if (state is TournamentDetailError) {
                return Center(child: Text(state.errorMessage));
              }
              return const TournamentSkeletonCard();
            }

            return Column(
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
                            padding: EdgeInsets.fromLTRB(
                              20,
                              0,
                              20,
                              (tournament.creatorId == currentUserId &&
                                      tournament.status ==
                                          TournamentStatus.registrationOpen)
                                  ? 180.0
                                  : 100.0,
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
            );
          },
        ),
      ),
    );
  }

  TournamentEntity? _getTournament(TournamentDetailState state) {
    if (state is TournamentDetailLoaded) return state.tournament;
    if (state is TeamSelectionLoading) return state.tournament;
    if (state is TeamSelectionLoaded) return state.tournament;
    if (state is TeamSelectionError) return state.tournament;
    return null;
  }

  String? _getCurrentUserId(TournamentDetailState state) {
    if (state is TournamentDetailLoaded) return state.currentUserId;
    if (state is TeamSelectionLoading) return state.currentUserId;
    if (state is TeamSelectionLoaded) return state.currentUserId;
    if (state is TeamSelectionError) return state.currentUserId;
    return null;
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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ImageProviderHelper.getImage(tournament.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Image.network(tournament.imageUrl, fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.bgMain, Colors.transparent],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: CustomBackButton(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  tournament.title,
                  style: AppTextStyles.h1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
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
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgMain,
                side: const BorderSide(color: AppColors.redColor, width: 2.0),
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
      // final teams = await serviceLocator<FetchUserTeamsUsecase>()();
      // if (context.mounted) {
      //   _showTeamSelector(context, teams);
      // }
      context.read<TournamentDetailBloc>().add(TournamentJoinTeamRequested());
    }
  }
}
