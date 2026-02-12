import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/ManagerDashboardScreen/bloc/manager_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManagerDashboardBloc(
        tournamentRepository: context.read<TournamentRepository>(),
      )..add(ManagerDashboardStarted()),
      child: _ManagerDashboardView(),
    );
  }
}

class _ManagerDashboardView extends StatefulWidget {
  const _ManagerDashboardView();

  @override
  State<_ManagerDashboardView> createState() => __ManagerDashboardViewState();
}

class __ManagerDashboardViewState extends State<_ManagerDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildCreateTournamentButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16.0),
              BlocBuilder<ManagerDashboardBloc, ManagerDashboardState>(
                builder: (context, state) {
                  if (state is ManagerDashboardLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (state is ManagerDashboardError) {
                    return const Text('Ошибка загрузки турниров');
                  }

                  if (state is ManagerDashboardLoaded) {
                    final tournaments = state.tournaments;

                    if (tournaments.isEmpty) {
                      return const Text('Турниры отсутствуют');
                    }

                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: tournaments.length,
                              itemBuilder: (context, index) {
                                return TournamentCard(
                                  tournament: tournaments[index],
                                  isManager: true,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return const Center(child: Text('Турниры отсутствуют'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBackButton(),
            Text('Панель организатора', style: AppTextStyles.h2),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCreateTournamentButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: GradientButton(
        text: 'Создать турнир',
        onPressed: () => context.push('/create-tournament'),
      ),
    );
  }
}
