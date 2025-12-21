import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/ManagerDashboardScreen/bloc/manager_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/create-tournament'),
        child: const Text('Создать турнир'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: BlocBuilder<ManagerDashboardBloc, ManagerDashboardState>(
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

                return ListView.builder(
                  itemCount: tournaments.length,
                  itemBuilder: (context, index) {
                    return TournamentCard(tournament: tournaments[index]);
                  },
                );
              }

              return const Center(child: Text('Турниры отсутствуют'));
            },
          ),
        ),
      ),
    );
  }
}
