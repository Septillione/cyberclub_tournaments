import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/widgets/card_setting.dart';
import 'package:cyberclub_tournaments/presentation/widgets/card_statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              switch (state) {
                case ProfileLoading():
                  return const Center(child: CircularProgressIndicator());
                case ProfileError():
                  return Center(child: Text('Ошибка: ${state.errorMessage}'));
                case ProfileLoaded():
                  final user = state.userProfile;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTop(context),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildHeader(user),
                            const SizedBox(height: 24),
                            CardSetting(
                              icon: LucideIcons.bell,
                              title: 'Уведомления',
                              onTap: () {},
                            ),
                            const SizedBox(height: 16),
                            if (user.role == UserRole.manager ||
                                user.role == UserRole.admin) ...[
                              CardSetting(
                                icon: LucideIcons.box,
                                title: 'Панель Организатора',
                                onTap: () {},
                              ),
                              const SizedBox(height: 16),
                            ],
                            CardSetting(
                              icon: LucideIcons.shieldCheck,
                              title: 'Приватность',
                              onTap: () {},
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.keyRound,
                              title: 'Сменить пароль',
                              onTap: () {},
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.heartHandshake,
                              title: 'Служба поддержки',
                              onTap: () {},
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.info,
                              title: 'О приложении',
                              onTap: () {},
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Row _buildTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Профиль', style: AppTextStyles.h2),
        PopupMenuButton<String>(
          icon: Icon(
            LucideIcons.settings,
            size: 24,
            color: AppColors.textSecondary,
          ),
          onSelected: (value) {
            if (value == 'leave') {
              _onLogout(context);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'configure',
              child: Text('Настроить аккаунт'),
            ),
            PopupMenuItem<String>(
              value: 'leave',
              child: Text('Выйти из аккаунта'),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildHeader(UserProfileModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: user.avatarUrl != null
              ? NetworkImage(user.avatarUrl!)
              : null,
          child: user.avatarUrl != null
              ? null
              : const Icon(LucideIcons.circleUserRound, size: 80),
        ),
        const SizedBox(height: 24),
        Text(
          user.nickname,
          style: AppTextStyles.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Row(
        //   children: [
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Турниры',
        //         value: '${user.tournamentsPlayed}',
        //         color: AppColors.textPrimary,
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Победы',
        //         value: '${user.tournamentsWon}',
        //         color: AppColors.accentPrimary,
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: CardStatistics(
        //         title: 'Winrate',
        //         value: '${user.winrate}%',
        //         color: AppColors.statusSuccess,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Future<void> _onLogout(BuildContext context) async {
    final shouldLogout = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Выйти',
              style: TextStyle(color: AppColors.statusError),
            ),
          ),
        ],
      ),
    );

    if (shouldLogout != true) return;

    if (context.mounted) {
      await context.read<AuthRepository>().logout();
      if (context.mounted) {
        context.go('/login');
      }
    }
  }
}
