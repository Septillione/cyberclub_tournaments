import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/bloc/tournament_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/bracket_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/general_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/participants_details.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentDetailScreen extends StatefulWidget {
  final String tournamentId;

  const TournamentDetailScreen({super.key, required this.tournamentId});

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
      builder: (context, state) {
        switch (state) {
          case TournamentDetailLoading():
            return const Center(child: CircularProgressIndicator());
          case TournamentDetailError():
            final error = state.errorMessage;
            return Center(child: Text(error));

          case TournamentDetailLoaded():
            final tournament = state.tournament;
            final currentUserId = state.currentUserId;
            return Scaffold(
              floatingActionButton: _buildRegisterButton(
                tournament,
                currentUserId,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              extendBodyBehindAppBar: true,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderImage(tournament),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.bgMain,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: SegmentedButtonDetails(
                              segments: const ['Общее', 'Участники', 'Сетка'],
                              initialIndex: _selectedSegmentIndex,
                              onSegmentTapped: (index) {
                                setState(() {
                                  _selectedSegmentIndex = index;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                          Expanded(child: _buildSegmentContent(tournament)),
                          SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
                  // SafeArea(
                  //   top: false,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       top: 8.0,
                  //       left: 16.0,
                  //       right: 16.0,
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         SegmentedButtonDetails(
                  //           segments: const ['Общее', 'Участники', 'Сетка'],
                  //           initialIndex: _selectedSegmentIndex,
                  //           onSegmentTapped: (index) {
                  //             setState(() {
                  //               _selectedSegmentIndex = index;
                  //             });
                  //           },
                  //         ),
                  //         SizedBox(height: 24),
                  //         _buildSegmentContent(tournament),
                  //         SizedBox(height: 64),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
        }
      },
    );
  }

  Widget _buildHeaderImage(TournamentModel tournament) {
    final imageUrl = tournament.imageUrl;
    ImageProvider imageProvider;

    if (imageUrl.startsWith('http')) {
      imageProvider = NetworkImage(imageUrl);
    } else {
      imageProvider = AssetImage(imageUrl);
    }

    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.bgMain,
                  AppColors.bgMain.withValues(alpha: 0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: CustomBackButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tournament.title,
                  style: AppTextStyles.h1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentContent(TournamentModel tournament) {
    switch (_selectedSegmentIndex) {
      case 0:
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
          child: GeneralDetails(tournament: tournament),
        );
      case 1:
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
          child: ParticipantsDetails(tournament: tournament),
        );
      case 2:
        return const BracketDetails();
      default:
        return const SizedBox.shrink();
    }
    // final List<Widget> segmentContents = [
    //   GeneralDetails(tournament: tournament),
    //   ParticipantsDetails(tournament: tournament),
    //   BracketDetails(),
    // ];

    // return segmentContents[_selectedSegmentIndex];
  }

  Widget _buildRegisterButton(
    TournamentModel tournament,
    String currentUserId,
  ) {
    final bool isCreator = tournament.creatorId == currentUserId;

    // if (isCreator && tournament.status == TournamentStatus.REGISTRATION_OPEN) {
    //   return Container(
    //     padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
    //     child: Row(
    //       children: [
    //         ElevatedButton(
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: AppColors.statusLive,
    //           ),
    //           onPressed: () => context.read<TournamentDetailBloc>().add(
    //             TournamentStartRequested(),
    //           ),
    //           child: const Text('ЗАПУСТИТЬ ТУРНИР'),
    //         ),
    //         SizedBox(width: 16),
    //         ElevatedButton(
    //           onPressed: () => _showJoinDialog(tournament),
    //           child: const Text('Зарегистрироваться'),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    switch (tournament.status) {
      case TournamentStatus.REGISTRATION_OPEN:
        if (isCreator) {
          return Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.statusLive,
                  ),
                  onPressed: () => context.read<TournamentDetailBloc>().add(
                    TournamentStartRequested(),
                  ),
                  child: const Text('ЗАПУСТИТЬ ТУРНИР'),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showJoinDialog(tournament),
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ],
          );
        } else {
          return Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () => _showJoinDialog(tournament),
              child: const Text('Зарегистрироваться'),
            ),
          );
        }
      case TournamentStatus.REGISTRATION_CLOSED:
        return Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ElevatedButton(
            onPressed: null,
            child: const Text('Регистрация закрыта'),
          ),
        );
      case TournamentStatus.ANNOUNCED:
        return Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ElevatedButton(
            onPressed: null,
            child: const Text('Анонсирован'),
          ),
        );
      case TournamentStatus.LIVE:
        if (isCreator) {
          return Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: ElevatedButton(
              onPressed: () => context.read<TournamentDetailBloc>().add(
                TournamentFinishRequested(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.statusWarning,
              ),
              child: const Text('Завершить турнир'),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: ElevatedButton(onPressed: null, child: const Text('LIVE')),
          );
        }
      case TournamentStatus.FINISHED:
        return Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ElevatedButton(onPressed: null, child: const Text('Завершён')),
        );
      case TournamentStatus.CANCELLED:
        return Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: ElevatedButton(onPressed: null, child: const Text('Отменён')),
        );
    }
  }

  void _showJoinDialog(TournamentModel tournament) {
    if (tournament.teamMode == TeamMode.solo) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: const Text('Участие'),
          content: const Text('Зарегистрироваться на турнир?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<TournamentDetailBloc>().add(
                  TournamentRegisterRequested(),
                );
                Navigator.pop(context);
              },
              child: const Text('Да, участвую'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            backgroundColor: AppColors.bgSurface,
            title: const Text('Выберите команду'),
            content: SizedBox(
              width: double.maxFinite,
              child: FutureBuilder<List<TeamModel>>(
                future: context.read<TeamRepository>().fetchUserTeams(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LinearProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text('Ошибка загрузки команд');
                  }

                  final teams = snapshot.data ?? [];

                  if (teams.isEmpty) {
                    return const Text(
                      'У вас нет команд. Создайте или вступите в новую команду.',
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: teams.length,
                    itemBuilder: (context, index) {
                      final team = teams[index];

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: team.avatarUrl != null
                              ? NetworkImage(team.avatarUrl!)
                              : null,
                        ),
                        title: Text(team.name, style: AppTextStyles.bodyL),
                        subtitle: Text(team.tag, style: AppTextStyles.caption),
                        onTap: () {
                          this.context.read<TournamentDetailBloc>().add(
                            TournamentRegisterRequested(teamId: team.id),
                          );
                          Navigator.pop(dialogContext);
                        },
                      );
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
  }
}
