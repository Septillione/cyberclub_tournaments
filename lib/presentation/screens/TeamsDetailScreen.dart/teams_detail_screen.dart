import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_request.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_teammate.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/card_statistics.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
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

                  final segments = isCaptain
                      ? ['Инфа', 'Состав', 'Турниры', 'Заявки']
                      : ['Инфа', 'Состав', 'Турниры'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTop(isCaptain, isMember, context, team),
                      _buildHeader(team),
                      const SizedBox(height: 24),
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
                      // SizedBox(height: 16),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Row _buildTop(
    bool isCaptain,
    bool isMember,
    BuildContext context,
    TeamModel team,
  ) {
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
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Удалить команду'),
                    onTap: () {
                      context.pop();
                      context.read<TeamDetailBloc>().add(
                        TeamDetailDeleteClicked(teamId: team.id),
                      );
                    },
                  ),
                ] else if (isMember) ...[
                  PopupMenuItem<String>(
                    value: 'leave',
                    child: Text('Покинуть команду'),
                    onTap: () {
                      context.pop();
                      context.read<TeamDetailBloc>().add(
                        TeamDetailLeaveClicked(teamId: team.id),
                      );
                    },
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
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColors.gradientDark, AppColors.gradientLight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          padding: const EdgeInsets.all(3.0),

          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bgMain,
            ),
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              radius: 64,
              backgroundColor: AppColors.bgMain,
              backgroundImage: team.avatarUrl != null
                  ? NetworkImage(team.avatarUrl!)
                  : null,
              child: team.avatarUrl == null
                  ? const Icon(
                      LucideIcons.users,
                      size: 40,
                      color: AppColors.textSecondary,
                    )
                  : null,
            ),
          ),
        ),

        const SizedBox(height: 12),

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
            Text(
              '[${team.tag}]',
              style: AppTextStyles.h2.copyWith(color: AppColors.accentPrimary),
            ),
          ],
        ),
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
    if (isCaptain) {
      switch (index) {
        case 0:
          return _buildInfoTab(team);
        case 1:
          return _buildRosterTab(
            team.members,
            isCaptain,
            ownerId,
            currentUserId,
          );
        case 2:
          return _buildTournamentsTab(team);
        case 3:
          return _buildRequestsTab(requests);
        default:
          return const SizedBox.shrink();
      }
    } else {
      switch (index) {
        case 0:
          return _buildInfoTab(team);
        case 1:
          return _buildRosterTab(
            team.members,
            isCaptain,
            ownerId,
            currentUserId,
          );
        case 2:
          return _buildTournamentsTab(team);
        default:
          return const SizedBox.shrink();
      }
    }
  }

  Widget _buildInfoTab(TeamModel team) {
    final captain = team.members.firstWhere(
      (m) => m.userId == team.ownerId,
      orElse: () => team.members.first,
    );

    final date = DateFormat(
      'd MMMM yyyy',
      'ru',
    ).format(team.createdAt ?? DateTime.now());

    final tournamentCount = team.entries.length;
    final winsCount = 0;
    final winrate = tournamentCount > 0
        ? ((winsCount / tournamentCount) * 100).toStringAsFixed(0)
        : '0';

    final gamesList = team.gamesList;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CardStatistics(
                    title: 'Турниров',
                    value: '$tournamentCount',
                    color: AppColors.blueColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CardStatistics(
                    title: 'Побед',
                    value: '$winsCount',
                    color: AppColors.redColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CardStatistics(
                    title: 'Winrate',
                    value: '$winrate%',
                    color: AppColors.greenColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Text('Игры', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          Row(
            children: [
              ...gamesList?.map(
                    (game) => Text('$game  |  ', style: AppTextStyles.bodyM),
                  ) ??
                  [],
            ],
          ),

          const SizedBox(height: 16),

          Text('Соцсети', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          Text('${team.socialMedia}', style: AppTextStyles.bodyM),

          const SizedBox(height: 16),

          Text('Описание', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          Text('${team.description}', style: AppTextStyles.bodyM),

          const SizedBox(height: 32),

          _buildInfoRow('Капитан', captain.user.nickname),

          const SizedBox(height: 16),

          _buildInfoRow('Дата создания', date),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: AppTextStyles.bodyL.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRosterTab(
    List<TeamMemberModel> teammates,
    bool isCaptain,
    String ownerId,
    String currentUserId,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Участники:', style: AppTextStyles.h3),
            Text('${teammates.length.toString()}/5', style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (isCaptain && index == teammates.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GradientButton(
                    text: 'Пригласить игрока',
                    onPressed: () {},
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
          ),
        ),
      ],
    );
  }

  Widget _buildTournamentsTab(TeamModel team) {
    if (team.entries.isEmpty) {
      return Center(child: Text('Команда еще не участвовала в турнирах'));
    }

    return ListView.builder(
      itemCount: team.entries.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final entry = team.entries[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TournamentCard(tournament: entry.tournament),
        );
      },
    );
  }

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
