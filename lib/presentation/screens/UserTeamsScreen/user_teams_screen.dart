import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TeamsDetailScreen.dart/widgets/team_search_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/team_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UserTeamsScreen extends StatefulWidget {
  const UserTeamsScreen({super.key});

  @override
  State<UserTeamsScreen> createState() => _UserTeamsScreenState();
}

class _UserTeamsScreenState extends State<UserTeamsScreen> {
  bool _isSearchActive = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _closeSearch() {
    if (_isSearchActive) {
      setState(() {
        _isSearchActive = false;
        _searchController.clear();
      });
      _focusNode.unfocus();
      context.read<UserTeamsBloc>().add(const UserTeamsSearchQueryChanged(''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _closeSearch,
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<UserTeamsBloc, UserTeamsState>(
                    builder: (context, state) {
                      switch (state) {
                        case UserTeamsLoading():
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        case UserTeamsError():
                          return Center(
                            child: Text('Ошибка: ${state.errorMessage}'),
                          );
                        case UserTeamsLoaded():
                          if (!_isSearchActive && state.teams.isEmpty) {
                            return _buildEmptyState(context);
                          }
                          return _buildTeamList(
                            state.teams,
                            state.currentUserId,
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Мои команды', style: AppTextStyles.h2),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSearchActive = !_isSearchActive;
                      });
                      if (!_isSearchActive) {
                        _searchController.clear();
                        // context.read<UserTeamsBloc>().add(
                        //   UserTeamsSearchQueryChanged(''),
                        // );
                        context.read<UserTeamsBloc>().add(UserTeamsStarted());
                      }
                    },
                    child: Icon(
                      _isSearchActive ? LucideIcons.x : LucideIcons.search,
                      size: 24,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () async {
                      await context.push('/create-team');
                      if (context.mounted) {
                        context.read<UserTeamsBloc>().add(UserTeamsStarted());
                      }
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

          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: _isSearchActive
                ? MediaQuery.of(context).size.width - 112
                : 0,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _isSearchActive
                  ? TextField(
                      controller: _searchController,
                      focusNode: _focusNode,
                      autofocus: true,
                      style: AppTextStyles.bodyL,
                      decoration: const InputDecoration(
                        hintText: 'Поиск...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        context.read<UserTeamsBloc>().add(
                          UserTeamsSearchQueryChanged(value),
                        );
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Column _buildEmptyState(BuildContext context) {
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamList(List<TeamModel> teams, String currentUserId) {
    if (_isSearchActive == true && _searchController.text == '') {
      return const SizedBox.shrink();
    } else if (_isSearchActive == true) {
      return ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          final team = teams[index];
          return TeamSearchCard(team: team, currentUserId: currentUserId);
        },
      );
    }
    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return TeamCard(team: team, currentUserId: currentUserId);
      },
    );
  }
}
