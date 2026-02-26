import 'package:cyberclub_tournaments/presentation/widgetsnew/card_statistics.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/segmented_button_details.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/bloc/team_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/widgets/card_request.dart';
import 'package:cyberclub_tournaments/presentation/screens/team_detail/widgets/card_teammate.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/tournament_card.dart';

class TeamDetailScreen extends StatefulWidget {
  final String teamId;

  const TeamDetailScreen({super.key, required this.teamId});

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<TeamDetailBloc>()
            ..add(TeamDetailStarted(teamId: widget.teamId)),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: BlocBuilder<TeamDetailBloc, TeamDetailState>(
              builder: (context, state) {
                return switch (state) {
                  TeamDetailLoading() => _SkeletonView(),
                  TeamDetailError(:final errorMessage) => Center(
                    child: Text('Ошибка: $errorMessage'),
                  ),
                  TeamDetailLoaded() => _LoadedView(
                    state: state,
                    selectedIndex: _selectedIndex,
                    onTabChanged: (i) => setState(() => _selectedIndex = i),
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final TeamDetailLoaded state;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const _LoadedView({
    required this.state,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final segments = state.isCaptain
        ? ['Инфа', 'Состав', 'Турниры', 'Заявки']
        : ['Инфа', 'Состав', 'Турниры'];

    return Column(
      children: [
        _AppBar(
          team: state.team,
          isCaptain: state.isCaptain,
          isMember: state.isMember,
        ),
        _Header(team: state.team),
        const SizedBox(height: 24),
        SegmentedButtonDetails(
          segments: segments,
          initialIndex: selectedIndex,
          onSegmentTapped: onTabChanged,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: _ContentSwitcher(index: selectedIndex, state: state),
        ),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  final TeamEntity team;
  final bool isCaptain;
  final bool isMember;

  const _AppBar({
    required this.team,
    required this.isCaptain,
    required this.isMember,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        if (isCaptain || isMember)
          _SettingsMenu(team: team, isCaptain: isCaptain, isMember: isMember),
      ],
    );
  }
}

class _SettingsMenu extends StatelessWidget {
  final TeamEntity team;
  final bool isCaptain;
  final bool isMember;

  const _SettingsMenu({
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
      onSelected: (value) => _handleAction(context, value),
      itemBuilder: (_) => _menuItems(),
    );
  }

  List<PopupMenuEntry<String>> _menuItems() {
    if (isCaptain) {
      return [
        _item(
          'edit',
          LucideIcons.pencil,
          'Редактировать',
          AppColors.textPrimary,
        ),
        _item('delete', LucideIcons.trash2, 'Удалить', AppColors.redColor),
      ];
    } else if (isMember) {
      return [
        _item('leave', LucideIcons.logOut, 'Покинуть', AppColors.redColor),
      ];
    }
    return [];
  }

  PopupMenuItem<String> _item(
    String value,
    IconData icon,
    String text,
    Color color,
  ) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.bodyM.copyWith(color: color)),
        ],
      ),
    );
  }

  void _handleAction(BuildContext context, String action) {
    final bloc = context.read<TeamDetailBloc>();
    switch (action) {
      case 'edit':
        context.push('/edit-team', extra: team);
      case 'delete':
        bloc.add(TeamDetailDeleteClicked(teamId: team.id));
      case 'leave':
        bloc.add(TeamDetailLeaveClicked(teamId: team.id));
    }
  }
}

class _Header extends StatelessWidget {
  final TeamEntity team;

  const _Header({required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TeamAvatar(avatarUrl: team.avatarUrl),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                team.name,
                style: AppTextStyles.h2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
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

class _TeamAvatar extends StatelessWidget {
  final String? avatarUrl;

  const _TeamAvatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.gradientDark, AppColors.gradientLight],
        ),
      ),
      child: CircleAvatar(
        radius: 64,
        backgroundColor: AppColors.bgMain,
        backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
        child: avatarUrl == null
            ? const Icon(
                LucideIcons.users,
                size: 40,
                color: AppColors.textSecondary,
              )
            : null,
      ),
    );
  }
}

class _ContentSwitcher extends StatelessWidget {
  final int index;
  final TeamDetailLoaded state;

  const _ContentSwitcher({required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (index) {
      0 => _InfoTab(team: state.team),
      1 => _RosterTab(
        team: state.team,
        isCaptain: state.isCaptain,
        currentUserId: state.currentUserId,
      ),
      2 => _TournamentsTab(team: state.team),
      3 when state.isCaptain => _RequestsTab(requests: state.joinRequests),
      _ => const SizedBox.shrink(),
    };
  }
}

class _InfoTab extends StatelessWidget {
  final TeamEntity team;

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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Statistics(stats: team.stats),
          const SizedBox(height: 32),
          _Section('Игры', _GamesList(games: team.gamesList!)),
          const SizedBox(height: 16),
          _Section('Соцсети', Text(team.socialMedia ?? '-')),
          const SizedBox(height: 16),
          _Section('Описание', Text(team.description ?? '-')),
          const SizedBox(height: 32),
          _InfoRow('Капитан', captain.user.nickname),
          const SizedBox(height: 16),
          _InfoRow('Дата создания', date),
        ],
      ),
    );
  }
}

class _Statistics extends StatelessWidget {
  final TeamStats stats;

  const _Statistics({required this.stats});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CardStatistics(
              title: 'Турниров',
              value: '${stats.tournamentsPlayed}',
              color: AppColors.blueColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardStatistics(
              title: 'Побед',
              value: '${stats.tournamentsWon}',
              color: AppColors.redColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardStatistics(
              title: 'Winrate',
              value: '${stats.winrate}%',
              color: AppColors.greenColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget content;

  const _Section(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h3),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}

class _GamesList extends StatelessWidget {
  final List<String> games;

  const _GamesList({required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      children: games
          .map((g) => Text('$g |', style: AppTextStyles.bodyM))
          .toList(),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
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

class _RosterTab extends StatelessWidget {
  final TeamEntity team;
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
            Text('${team.members.length}/5', style: AppTextStyles.h3),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: team.members.length + (isCaptain ? 1 : 0),
            itemBuilder: (context, index) {
              if (isCaptain && index == team.members.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GradientButton(
                    text: 'Пригласить игрока',
                    onPressed: () => context.push('/find-user', extra: team.id),
                  ),
                );
              }
              return CardTeammate(
                teammate: team.members[index],
                ownerId: team.ownerId,
                currentUserId: currentUserId,
                teamId: team.id,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TournamentsTab extends StatelessWidget {
  final TeamEntity team;

  const _TournamentsTab({required this.team});

  @override
  Widget build(BuildContext context) {
    if (team.entries.isEmpty) {
      return const Center(child: Text('Команда еще не участвовала в турнирах'));
    }
    return ListView.separated(
      itemCount: team.entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return TournamentCard(tournament: team.entries[index].tournament);
      },
    );
  }
}

class _RequestsTab extends StatelessWidget {
  final List requests;

  const _RequestsTab({required this.requests});

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return const Center(child: Text('Нет заявок на вступление'));
    }
    return ListView.separated(
      itemCount: requests.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final request = requests[index];
        return CardRequest(
          joinRequest: request,
          onAccept: () => context.read<TeamDetailBloc>().add(
            AcceptRequestClicked(requestId: request.id),
          ),
          onReject: () => context.read<TeamDetailBloc>().add(
            RejectRequestClicked(requestId: request.id),
          ),
        );
      },
    );
  }
}

class _SkeletonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (_, __) => const TournamentSkeletonCard(),
    );
  }
}
