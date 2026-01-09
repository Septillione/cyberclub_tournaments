import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamSearchScreen/bloc/team_search_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/team_search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamSearchScreen extends StatelessWidget {
  const TeamSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamSearchBloc(
        teamRepository: context.read<TeamRepository>(),
        authRepository: context.read<AuthRepository>(),
      ),
      child: const _TeamSearchView(),
    );
  }
}

class _TeamSearchView extends StatelessWidget {
  const _TeamSearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Название или тег...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => context.read<TeamSearchBloc>().add(
                  TeamSearchQueryChanged(value),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: BlocConsumer<TeamSearchBloc, TeamSearchState>(
                  listener: (context, state) {
                    if (state is TeamSearchLoaded &&
                        state.successMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.successMessage!),
                          backgroundColor: AppColors.greenColor,
                        ),
                      );
                    }

                    if (state is TeamSearchError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                          backgroundColor: AppColors.redColor,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is TeamSearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is TeamSearchLoaded) {
                      if (state.teams.isEmpty) {
                        return const Center(child: Text('Ничего не найдено'));
                      }

                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final team = state.teams[index];

                          return TeamSearchCard(
                            team: team,
                            currentUserId: state.currentUserId,
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemCount: state.teams.length,
                      );
                    }

                    return const Center(
                      child: Text('Введите название команды'),
                    );
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
