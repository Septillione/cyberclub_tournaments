import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/presentation/screens/tournaments_feed/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/bloc/create_tournament_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/manager_dashboard/bloc/manager_dashboard_bloc.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              serviceLocator<ManagerDashboardBloc>()
                ..add(ManagerDashboardStarted()),
        ),
        BlocProvider(create: (_) => serviceLocator<CreateTournamentBloc>()),
      ],
      child: const _ManagerDashboardView(),
    );
  }
}

class _ManagerDashboardView extends StatelessWidget {
  const _ManagerDashboardView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTournamentBloc, CreateTournamentState>(
      listener: (context, state) => _handleCreateState(context, state),
      child: Scaffold(
        floatingActionButton: _CreateButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                const _Header(),
                const SizedBox(height: 16),
                const Expanded(child: _TournamentsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleCreateState(BuildContext context, CreateTournamentState state) {
    if (state is CreateTournamentSuccess) {
      context.read<ManagerDashboardBloc>().add(ManagerDashboardStarted());
      _showSnackBar(context, 'Успешно выполнено', AppColors.greenColor);
    }
    if (state is CreateTournamentFailure) {
      _showSnackBar(
        context,
        'Ошибка: ${state.errorMessage}',
        AppColors.redColor,
      );
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text('Панель организатора', style: AppTextStyles.h2),
      ],
    );
  }
}

class _TournamentsList extends StatelessWidget {
  const _TournamentsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagerDashboardBloc, ManagerDashboardState>(
      builder: (context, state) {
        return switch (state) {
          ManagerDashboardLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          ManagerDashboardError(:final errorMessage) => Center(
            child: Text(errorMessage),
          ),
          ManagerDashboardLoaded(:final tournaments) =>
            tournaments.isEmpty
                ? const Center(child: Text('Турниры отсутствуют'))
                : ListView.separated(
                    itemCount: tournaments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return TournamentCard(
                        tournament: tournaments[index],
                        isManager: true,
                        onCancel: (id) => _onCancel(context, id),
                      );
                    },
                  ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  void _onCancel(BuildContext context, String id) {
    context.read<CreateTournamentBloc>().add(
      CancelTournamentSubmitted(tournamentId: id),
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: GradientButton(
        text: 'Создать турнир',
        onPressed: () => context.push('/create-tournament'),
      ),
    );
  }
}
