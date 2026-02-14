import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_request.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/card_teammate.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/card_statistics.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:cyberclub_tournaments/presentation/widgets/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamDetailScreen extends StatefulWidget {
  const TeamDetailScreen({super.key});

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: BlocBuilder<TeamDetailBloc, TeamDetailState>(
            builder: (context, state) {
              return switch (state) {
                TeamDetailLoading() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const TournamentSkeletonCard();
                    },
                  ),
                ),

                TeamDetailError() => Center(
                  child: Text('Ошибка: ${state.errorMessage}'),
                ),

                TeamDetailLoaded() => _buildLoadedState(context, state),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, TeamDetailLoaded state) {
    final segments = state.isCaptain
        ? ['Инфа', 'Состав', 'Турниры', 'Заявки']
        : ['Инфа', 'Состав', 'Турниры'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TeamAppBar(
          team: state.team,
          isCaptain: state.isCaptain,
          isMember: state.isMember,
        ),
        _TeamHeader(team: state.team),
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
          child: _TeamContentSwitcher(
            index: _selectedSegmentIndex,
            state: state,
          ),
        ),
      ],
    );
  }
}

// Верхняя панель (кнопка назад + Меню)
class _TeamAppBar extends StatelessWidget {
  final TeamModel team;
  final bool isCaptain;
  final bool isMember;

  const _TeamAppBar({
    required this.team,
    required this.isCaptain,
    required this.isMember,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        if (isCaptain || isMember)
          _TeamSettingsMenu(
            team: team,
            isCaptain: isCaptain,
            isMember: isMember,
          ),
      ],
    );
  }
}

// Меню настроек
class _TeamSettingsMenu extends StatelessWidget {
  final TeamModel team;
  final bool isCaptain;
  final bool isMember;

  const _TeamSettingsMenu({
    required this.team,
    required this.isCaptain,
    required this.isMember,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      elevation: 4,
      color: AppColors.bgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.bgMain, width: 1),
      ),
      offset: const Offset(0, 50),
      icon: const Icon(
        LucideIcons.settings,
        size: 24,
        color: AppColors.textSecondary,
      ),
      onSelected: (value) => _handleMenuAction(context, value),
      itemBuilder: (context) => _buildMenuItems(),
    );
  }

  List<PopupMenuEntry<String>> _buildMenuItems() {
    if (isCaptain) {
      return [
        _buildMenuItem(
          'edit',
          LucideIcons.pencil,
          'Редактировать',
          AppColors.textPrimary,
        ),
        _buildMenuItem(
          'delete',
          LucideIcons.trash2,
          'Удалить команду',
          AppColors.redColor,
        ),
      ];
    } else if (isMember) {
      return [
        _buildMenuItem(
          'leave',
          LucideIcons.logOut,
          'Покинуть команду',
          AppColors.redColor,
        ),
      ];
    }
    return [];
  }

  PopupMenuItem<String> _buildMenuItem(
    String value,
    IconData icon,
    String text,
    Color color,
  ) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodyM.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String value) {
    switch (value) {
      case 'edit':
        context.push('/edit-team', extra: team);
        break;
      case 'delete':
        context.read<TeamDetailBloc>().add(
          TeamDetailDeleteClicked(teamId: team.id),
        );
        break;
      case 'leave':
        context.read<TeamDetailBloc>().add(
          TeamDetailLeaveClicked(teamId: team.id),
        );
        break;
    }
  }
}

// Заголовок команды
class _TeamHeader extends StatelessWidget {
  final TeamModel team;

  const _TeamHeader({required this.team});

  @override
  Widget build(BuildContext context) {
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
}

// Переключатель контента
class _TeamContentSwitcher extends StatelessWidget {
  final int index;
  final TeamDetailLoaded state;

  const _TeamContentSwitcher({required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return _InfoTab(team: state.team);
      case 1:
        return _RosterTab(
          team: state.team,
          isCaptain: state.isCaptain,
          currentUserId: state.currentUserId,
        );
      case 2:
        return _TournamentsTab(team: state.team);
      case 3:
        if (state.isCaptain) return _RequestsTab(requests: state.joinRequests);
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }
}

//Таб: Информация
class _InfoTab extends StatelessWidget {
  final TeamModel team;

  const _InfoTab({required this.team});

  @override
  Widget build(BuildContext context) {
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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatistics(tournamentCount, winsCount, winrate),
          const SizedBox(height: 32),
          _buildSection('Игры', _buildGamesWrap(team.gamesList!)),
          const SizedBox(height: 16),
          _buildSection(
            'Соцсети',
            Text(team.socialMedia ?? '-', style: AppTextStyles.bodyM),
          ),
          const SizedBox(height: 16),
          _buildSection(
            'Описание',
            Text(team.description ?? '-', style: AppTextStyles.bodyM),
          ),
          const SizedBox(height: 32),
          _buildInfoRow('Капитан', captain.user.nickname),
          const SizedBox(height: 16),
          _buildInfoRow('Дата создания', date),
        ],
      ),
    );
  }

  Widget _buildStatistics(int tournaments, int wins, String winrate) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CardStatistics(
              title: 'Турниров',
              value: '$tournaments',
              color: AppColors.blueColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardStatistics(
              title: 'Побед',
              value: '$wins',
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
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h3),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildGamesWrap(List<String?> games) {
    if (games.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: games
          .map((game) => Text('$game  |', style: AppTextStyles.bodyM))
          .toList(),
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
}

//Таб: Состав
class _RosterTab extends StatelessWidget {
  final TeamModel team;
  final bool isCaptain;
  final String currentUserId;

  const _RosterTab({
    required this.team,
    required this.isCaptain,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Участники:', style: AppTextStyles.h3),
            Text(
              '${team.members.length.toString()}/5',
              style: AppTextStyles.h3,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: team.members.length + (isCaptain ? 1 : 0),
            itemBuilder: (context, index) {
              if (isCaptain && index == team.members.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GradientButton(
                    text: 'Пригласить игрока',
                    onPressed: () {
                      context.push('/find-user', extra: team.id);
                    },
                  ),
                );
              }
              final teammate = team.members[index];
              return CardTeammate(
                teammate: teammate,
                ownerId: team.ownerId,
                currentUserId: currentUserId,
              );
            },
          ),
        ),
      ],
    );
  }
}

//Таб: Турниры
class _TournamentsTab extends StatelessWidget {
  final TeamModel team;

  const _TournamentsTab({required this.team});

  @override
  Widget build(BuildContext context) {
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
}

//Таб: Заявки
class _RequestsTab extends StatelessWidget {
  final List<JoinRequestModel> requests;

  const _RequestsTab({required this.requests});

  @override
  Widget build(BuildContext context) {
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
  }
}
