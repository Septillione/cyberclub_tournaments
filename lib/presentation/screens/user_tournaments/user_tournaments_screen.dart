import 'package:cyberclub_tournaments/presentation/widgetsnew/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/bloc/user_tournaments_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/widgets/active_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/widgets/upcoming_tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_tournaments/widgets/finished_tournament_card.dart';

class UserTournamentsScreen extends StatelessWidget {
  const UserTournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<UserTournamentsBloc>()..add(UserTournamentsStarted()),
      child: const _UserTournamentsView(),
    );
  }
}

class _UserTournamentsView extends StatelessWidget {
  const _UserTournamentsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Мои турниры', style: AppTextStyles.h2),
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<UserTournamentsBloc, UserTournamentsState>(
                  builder: (context, state) {
                    return switch (state) {
                      UserTournamentsLoading() => _SkeletonList(),
                      UserTournamentsError(:final errorMessage) => Center(
                        child: Text('Ошибка: $errorMessage'),
                      ),
                      UserTournamentsLoaded() => _Content(state: state),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final UserTournamentsLoaded state;

  const _Content({required this.state});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: AppColors.bgMain,
      backgroundColor: AppColors.accentPrimary,
      height: 60,
      showChildOpacityTransition: false,
      onRefresh: () async {
        context.read<UserTournamentsBloc>().add(UserTournamentsRefreshed());
      },
      child: ListView(
        children: [
          _Section(
            title: 'Активные',
            tournaments: state.activeTournaments,
            itemBuilder: (t) => ActiveTournamentCard(
              tournament: t,
              currentUserId: state.currentUserId,
            ),
            emptyMessage: 'Нет активных турниров',
          ),
          const SizedBox(height: 24),
          _Section(
            title: 'Предстоящие',
            tournaments: state.upcomingTournaments,
            itemBuilder: (t) => UpcomingTournamentCard(
              tournament: t,
              currentUserId: state.currentUserId,
            ),
            emptyMessage: 'Нет предстоящих турниров',
          ),
          const SizedBox(height: 24),
          _Section(
            title: 'Завершенные',
            tournaments: state.finishedTournaments,
            itemBuilder: (t) => FinishedTournamentCard(
              tournament: t,
              currentUserId: state.currentUserId,
            ),
            emptyMessage: 'Нет завершенных турниров',
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<TournamentEntity> tournaments;
  final Widget Function(TournamentEntity) itemBuilder;
  final String emptyMessage;

  const _Section({
    required this.title,
    required this.tournaments,
    required this.itemBuilder,
    required this.emptyMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodyL),
        const SizedBox(height: 16),
        if (tournaments.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                emptyMessage,
                style: const TextStyle(color: AppColors.textDisabled),
              ),
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Row(
              children: tournaments.map((t) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(width: 320, child: itemBuilder(t)),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

class _SkeletonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (_, __) => const TournamentSkeletonCard(),
    );
  }
}
