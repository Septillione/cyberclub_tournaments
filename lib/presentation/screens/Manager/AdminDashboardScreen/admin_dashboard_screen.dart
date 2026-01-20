import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/players_segment_for_admin.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/teams_segment_for_admin.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/tournaments_segment_for_admin.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminDashboardBloc(
        tournamentRepository: context.read<TournamentRepository>(),
        userRepository: context.read<UserRepository>(),
        teamRepository: context.read<TeamRepository>(),
      )..add(AdminDashboardStarted()),
      child: _AdminDashboardView(),
    );
  }
}

class _AdminDashboardView extends StatefulWidget {
  const _AdminDashboardView();

  @override
  State<_AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<_AdminDashboardView> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
            builder: (context, state) {
              if (state is AdminDashboardLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AdminDashboardError) {
                return const Text('Ошибка загрузки турниров');
              }

              if (state is AdminDashboardLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    Expanded(child: _buildSegmentContent(state)),
                  ],
                );
              }

              return const Center(child: Text('Турниры отсутствуют'));
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBackButton(),
            Text('Панель организатора', style: AppTextStyles.h2),
          ],
        ),

        const SizedBox(height: 24),

        SegmentedButtonDetails(
          segments: const ['Турниры', 'Игроки', 'Команды'],
          initialIndex: _selectedSegmentIndex,
          onSegmentTapped: (index) {
            setState(() {
              _selectedSegmentIndex = index;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSegmentContent(AdminDashboardLoaded state) {
    switch (_selectedSegmentIndex) {
      case 0:
        return TournamentsSegmentForAdmin(
          tournaments: state.tournaments,
          stats: state.stats,
        );
      case 1:
        return PlayersSegmentForAdmin(users: state.users, stats: state.stats);
      case 2:
        return TeamsSegmentForAdmin(teams: state.teams, stats: state.stats);
      default:
        return const SizedBox.shrink();
    }
  }
}
