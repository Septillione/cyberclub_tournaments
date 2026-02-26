import 'package:cyberclub_tournaments/presentation/widgetsnew/tournament_skeleton_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/bloc/user_teams_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/widgets/team_card.dart';
import 'package:cyberclub_tournaments/presentation/screens/user_teams/widgets/team_search_card.dart';

class UserTeamsScreen extends StatelessWidget {
  const UserTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<UserTeamsBloc>()..add(UserTeamsStarted()),
      child: const _UserTeamsView(),
    );
  }
}

class _UserTeamsView extends StatefulWidget {
  const _UserTeamsView();

  @override
  State<_UserTeamsView> createState() => _UserTeamsViewState();
}

class _UserTeamsViewState extends State<_UserTeamsView> {
  bool _isSearchActive = false;
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      if (!_isSearchActive) {
        _searchController.clear();
        _focusNode.unfocus();
        context.read<UserTeamsBloc>().add(UserTeamsStarted());
      } else {
        context.read<UserTeamsBloc>().add(TeamsSearchStarted());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (_isSearchActive) _toggleSearch();
        },
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                _Header(
                  isSearchActive: _isSearchActive,
                  controller: _searchController,
                  focusNode: _focusNode,
                  onSearchToggle: _toggleSearch,
                  onSearchChanged: (v) => context.read<UserTeamsBloc>().add(
                    TeamsSearchQueryChanged(v),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocConsumer<UserTeamsBloc, UserTeamsState>(
                    listener: (context, state) {
                      if (state is UserTeamsLoaded &&
                          state.successMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.successMessage!),
                            backgroundColor: AppColors.greenColor,
                          ),
                        );
                      }
                      if (state is UserTeamsError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: AppColors.redColor,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return switch (state) {
                        UserTeamsLoading() => _SkeletonList(),
                        UserTeamsError() => Center(
                          child: Text(state.errorMessage),
                        ),
                        UserTeamsLoaded() => _Content(
                          state: state,
                          isSearchActive: _isSearchActive,
                          onRefresh: () async {
                            context.read<UserTeamsBloc>().add(
                              UserTeamsRefreshed(),
                            );
                          },
                        ),
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
}

class _Header extends StatelessWidget {
  final bool isSearchActive;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSearchToggle;
  final ValueChanged<String> onSearchChanged;

  const _Header({
    required this.isSearchActive,
    required this.controller,
    required this.focusNode,
    required this.onSearchToggle,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                    icon: Icon(
                      isSearchActive ? LucideIcons.x : LucideIcons.search,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: onSearchToggle,
                  ),
                  IconButton(
                    icon: const Icon(
                      LucideIcons.circleFadingPlus,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () async {
                      await context.push('/create-team');
                      if (context.mounted) {
                        context.read<UserTeamsBloc>().add(UserTeamsStarted());
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isSearchActive ? MediaQuery.of(context).size.width - 112 : 0,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: isSearchActive
                ? TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    style: AppTextStyles.bodyL,
                    decoration: const InputDecoration(
                      hintText: 'Поиск...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                    ),
                    onChanged: onSearchChanged,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final UserTeamsLoaded state;
  final bool isSearchActive;
  final Future<void> Function() onRefresh;

  const _Content({
    required this.state,
    required this.isSearchActive,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (state.teams.isEmpty) {
      return _EmptyState(
        message: isSearchActive ? 'Команды не найдены' : 'Вы еще не в команде',
        subMessage: isSearchActive
            ? null
            : 'Создайте свою команду или присоединитесь к существующей.',
      );
    }

    if (isSearchActive) {
      return ListView.builder(
        itemCount: state.teams.length,
        itemBuilder: (context, index) {
          return TeamSearchCard(
            team: state.teams[index],
            currentUserId: state.currentUserId,
          );
        },
      );
    }

    return LiquidPullToRefresh(
      color: AppColors.bgMain,
      backgroundColor: AppColors.accentPrimary,
      height: 60,
      showChildOpacityTransition: false,
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: state.teams.length,
        itemBuilder: (context, index) {
          return TeamCard(
            team: state.teams[index],
            currentUserId: state.currentUserId,
          );
        },
      ),
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

class _EmptyState extends StatelessWidget {
  final String message;
  final String? subMessage;

  const _EmptyState({required this.message, this.subMessage});

  @override
  Widget build(BuildContext context) {
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
          Text(message, style: AppTextStyles.h3),
          if (subMessage != null) ...[
            const SizedBox(height: 16),
            Text(
              subMessage!,
              style: AppTextStyles.bodyM.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
