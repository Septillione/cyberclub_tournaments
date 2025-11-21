import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UserTeamsScreen extends StatelessWidget {
  const UserTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Мои команды', style: AppTextStyles.h2),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Search team is pressed!');
                        },
                        child: Icon(
                          LucideIcons.search,
                          size: 24,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          print('Create team is pressed!');
                        },
                        child: Icon(
                          LucideIcons.circleFadingPlus,
                          size: 24,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<UserTeamsBloc, UserTeamsState>(
                  builder: (context, state) {
                    switch (state) {
                      case UserTeamsLoading():
                        return const Center(child: CircularProgressIndicator());
                      case UserTeamsError():
                        return Center(
                          child: Text('Ошибка: ${state.errorMessage}'),
                        );
                      case UserTeamsLoaded():
                        if (state.teams.isEmpty) {
                          return _buildEmptyState();
                        }
                        return _buildTeamList(state.teams);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildEmptyState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.handshake200,
                size: 64,
                color: AppColors.textDisabled,
              ),
              const SizedBox(height: 8),
              Text('Вы еще не в команде', style: AppTextStyles.h3),
              const SizedBox(height: 16),
              Text(
                'Создайте свою команду или присоединитесь к существующей, чтобы участвовать в командных турнирах.',
                style: AppTextStyles.button.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Text('Создать команду', style: AppTextStyles.button),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Найти команду', style: AppTextStyles.button),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamList(List<TeamListItemModel> teams) {
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return TeamCard(team: team);
      },
    );
  }
}
