import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/team_search_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/widgets/team_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
      context.read<UserTeamsBloc>().add(UserTeamsStarted());
    }
  }

  void _openSearch() {
    setState(() {
      _isSearchActive = true;
    });
    context.read<UserTeamsBloc>().add(TeamsSearchStarted());
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
                      return switch (state) {
                        UserTeamsLoading() => _buildLoading(),
                        UserTeamsError() => Center(
                          child: Text('Ошибка: ${state.errorMessage}'),
                        ),
                        UserTeamsLoaded() => _buildContent(context, state),
                        _ => const SizedBox.shrink(),
                      };
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

  // App bar
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
                      if (_isSearchActive) {
                        _closeSearch();
                      } else {
                        _openSearch();
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
                          TeamsSearchQueryChanged(value),
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

  // Списки команд
  Widget _buildContent(BuildContext context, UserTeamsLoaded state) {
    if (state.teams.isEmpty) {
      if (_isSearchActive) {
        return _buildEmptySearchState();
      }
      return _buildEmptyMyTeamsState();
    }

    if (_isSearchActive) {
      return ListView.builder(
        itemCount: state.teams.length,
        itemBuilder: (context, index) {
          final team = state.teams[index];
          return TeamSearchCard(team: team, currentUserId: state.currentUserId);
        },
      );
    }

    return LiquidPullToRefresh(
      color: AppColors.bgMain,
      backgroundColor: AppColors.accentPrimary,
      height: 60,
      animSpeedFactor: 5.0,
      showChildOpacityTransition: false,
      onRefresh: () async {
        context.read<UserTeamsBloc>().add(UserTeamsRefreshed());
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        itemCount: state.teams.length,
        itemBuilder: (context, index) {
          final team = state.teams[index];
          return TeamCard(team: team, currentUserId: state.currentUserId);
        },
      ),
    );
  }

  // Состояние загрузки
  Widget _buildLoading() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => const TournamentSkeletonCard(),
    );
  }

  // Пусто в Мои команды
  Widget _buildEmptyMyTeamsState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.handshake,
            size: 64,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: 8),
          Text('Вы еще не в команде', style: AppTextStyles.h3),
          const SizedBox(height: 16),
          Text(
            'Создайте свою команду или присоединитесь к существующей.',
            style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Пусто в "Поиске"
  Widget _buildEmptySearchState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.searchX,
            size: 64,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: 8),
          Text('Команды не найдены', style: AppTextStyles.h3),
        ],
      ),
    );
  }
}
