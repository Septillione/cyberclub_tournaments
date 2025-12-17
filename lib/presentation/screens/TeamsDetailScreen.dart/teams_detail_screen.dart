import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_request.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_teammate.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamsDetailScreen extends StatefulWidget {
  const TeamsDetailScreen({super.key});

  @override
  State<TeamsDetailScreen> createState() => _TeamsDetailScreenState();
}

class _TeamsDetailScreenState extends State<TeamsDetailScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: BlocBuilder<TeamDetailBloc, TeamDetailState>(
            builder: (context, state) {
              switch (state) {
                case TeamDetailLoading():
                  return const Center(child: CircularProgressIndicator());
                case TeamDetailError():
                  return Center(child: Text('Ошибка: ${state.errorMessage}'));
                case TeamDetailLoaded():
                  final team = state.team;
                  final isCaptain = state.isCaptain;
                  final isMember = state.isMember;
                  final requests = state.joinRequests;
                  final ownerId = team.ownerId;
                  final currentUserId = state.currentUserId;

                  // final segments = isCaptain
                  //     ? ['Состав', 'Турниры', 'Приглашения']
                  //     : ['Состав', 'Турниры'];
                  final segments = isCaptain
                      ? ['Состав', 'Приглашения']
                      : ['Состав'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTop(isCaptain, isMember, context),
                      _buildHeader(team),
                      const SizedBox(height: 16),
                      SegmentedButtonDetails(
                        segments: segments,
                        initialIndex: _selectedSegmentIndex,
                        onSegmentTapped: (index) {
                          setState(() {
                            _selectedSegmentIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: _buildSegmentContent(
                          team,
                          _selectedSegmentIndex,
                          isCaptain,
                          requests,
                          ownerId,
                          currentUserId,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Row _buildTop(bool isCaptain, bool isMember, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        if (isCaptain || isMember) ...[
          GestureDetector(
            onTap: () {
              print('Settings team is pressed!');
            },
            child: PopupMenuButton<String>(
              icon: Icon(
                LucideIcons.settings,
                size: 24,
                color: AppColors.textSecondary,
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                if (isCaptain) ...[
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Редактировать'),
                  ),
                ] else if (isMember) ...[
                  PopupMenuItem<String>(
                    value: 'leave',
                    child: Text('Покинуть команду'),
                  ),
                ] else
                  ...[],
              ],
            ),
          ),
        ],
      ],
    );
  }

  Column _buildHeader(TeamModel team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: team.avatarUrl != null
              ? NetworkImage(team.avatarUrl!)
              : null,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                '${team.name} ',
                style: AppTextStyles.h2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text('[${team.tag}]', style: AppTextStyles.h2),
          ],
        ),
        const SizedBox(height: 16),
        // Row(
        //   // mainAxisSize: MainAxisSize.max,
        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Турниров',
        //         value: '${team.tournamentsCount}',
        //         color: AppColors.textPrimary,
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Побед',
        //         value: '${team.winsCount}',
        //         color: AppColors.accentPrimary,
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Winrate',
        //         value: '${team.winrate}%',
        //         color: AppColors.statusSuccess,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildSegmentContent(
    TeamModel team,
    int index,
    bool isCaptain,
    List<JoinRequestModel> requests,
    String ownerId,
    String currentUserId,
  ) {
    List<Widget> captainWidgets = [
      _buildRosterTab(team.members, isCaptain, ownerId, currentUserId),
      // _buildTournamentsTab(team),
      _buildRequestsTab(requests),
    ];
    List<Widget> playerWidgets = [
      _buildRosterTab(team.members, isCaptain, ownerId, currentUserId),
      // _buildTournamentsTab(team),
    ];

    return isCaptain ? captainWidgets[index] : playerWidgets[index];
  }

  Widget _buildRosterTab(
    List<TeamMemberModel> teammates,
    bool isCaptain,
    String ownerId,
    String currentUserId,
  ) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (isCaptain && index == teammates.length) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Пригласить игрока'),
            ),
          );
        }
        final teammate = teammates[index];
        return CardTeammate(
          teammate: teammate,
          ownerId: ownerId,
          currentUserId: currentUserId,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: teammates.length + (isCaptain ? 1 : 0),
    );
  }

  // Widget _buildTournamentsTab(TeamModel team) {
  //   return ListView.builder(
  //     padding: EdgeInsets.zero,
  //     itemCount: team.tournaments.length,
  //     itemBuilder: (context, index) {
  //       final tournament = team.tournaments[index];
  //       return Padding(
  //         padding: const EdgeInsets.only(bottom: 16.0),
  //         child: TeamTournamentCard(tournament: tournament, team: team),
  //       );
  //     },
  //   );
  // }

  Widget _buildRequestsTab(List<JoinRequestModel> requests) {
    if (requests.isEmpty) {
      return const Center(child: Text('Нет заявок на вступление'));
    }

    return ListView.builder(
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return CardRequest(
          joinRequest: request,
          onAccept: () {
            context.read<TeamDetailBloc>().add(
              AcceptRequestClicked(requestId: request.id),
            );
          },
          onReject: () {
            context.read<TeamDetailBloc>().add(
              RejectRequestClicked(requestId: request.id),
            );
          },
        );
      },
    );

    // return ListView.builder(
    //   padding: EdgeInsets.zero,
    //   itemCount: 1 + (hasApplications ? 1 + team.applications.length : 0),
    //   itemBuilder: (context, index) {
    //     if (index == 0) {
    //       return Container(
    //         padding: EdgeInsets.all(16.0),
    //         decoration: BoxDecoration(
    //           color: AppColors.bgSurface,
    //           borderRadius: BorderRadius.circular(16.0),
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('Ссылка приглашение', style: AppTextStyles.h3),
    //             const SizedBox(height: 16),
    //             Row(
    //               children: [
    //                 Text(team.inviteLink, style: AppTextStyles.caption),
    //                 const SizedBox(width: 12),
    //                 GestureDetector(
    //                   onTap: () {
    //                     Clipboard.setData(ClipboardData(text: team.inviteLink));
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       const SnackBar(content: Text('Ссылка скопирована')),
    //                     );
    //                   },
    //                   child: Icon(
    //                     LucideIcons.copy,
    //                     size: 24,
    //                     color: AppColors.textSecondary,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     }

    //     if (index == 1) {
    //       return Padding(
    //         padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
    //         child: Text(
    //           'Заявки на вступление (${team.applications.length})',
    //           style: AppTextStyles.h3,
    //         ),
    //       );
    //     }

    //     final applicationIndex = index - 2;
    //     final application = team.applications[applicationIndex];

    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 16.0),
    //       child: CardApplication(teamApplication: application),
    //     );
    //   },
    // );
  }
}
