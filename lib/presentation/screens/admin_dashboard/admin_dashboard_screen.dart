import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/tournaments_segment.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/players_segment.dart';
import 'package:cyberclub_tournaments/presentation/screens/admin_dashboard/widgets/teams_segment.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<AdminDashboardBloc>()..add(AdminDashboardStarted()),
      child: const _AdminDashboardView(),
    );
  }
}

class _AdminDashboardView extends StatefulWidget {
  const _AdminDashboardView();

  @override
  State<_AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<_AdminDashboardView> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
            builder: (context, state) {
              return switch (state) {
                AdminDashboardLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                AdminDashboardError(:final errorMessage) => Center(
                  child: Text(errorMessage),
                ),
                AdminDashboardLoaded() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Header(
                      selectedSegment: _selectedSegment,
                      onSegmentChanged: (i) =>
                          setState(() => _selectedSegment = i),
                    ),
                    Expanded(
                      child: _SegmentContent(
                        state: state,
                        selectedSegment: _selectedSegment,
                      ),
                    ),
                  ],
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final int selectedSegment;
  final ValueChanged<int> onSegmentChanged;

  const _Header({
    required this.selectedSegment,
    required this.onSegmentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomBackButton(),
            Text('Панель администратора', style: AppTextStyles.h2),
          ],
        ),
        const SizedBox(height: 24),
        SegmentedButtonDetails(
          segments: const ['Турниры', 'Игроки', 'Команды'],
          initialIndex: selectedSegment,
          onSegmentTapped: onSegmentChanged,
        ),
      ],
    );
  }
}

class _SegmentContent extends StatelessWidget {
  final AdminDashboardLoaded state;
  final int selectedSegment;

  const _SegmentContent({required this.state, required this.selectedSegment});

  @override
  Widget build(BuildContext context) {
    return switch (selectedSegment) {
      0 => TournamentsSegment(
        tournaments: state.tournaments,
        stats: state.stats.tournaments,
      ),
      1 => PlayersSegment(users: state.users, stats: state.stats.users),
      2 => TeamsSegment(teams: state.teams, stats: state.stats.teams),
      _ => const SizedBox.shrink(),
    };
  }
}
