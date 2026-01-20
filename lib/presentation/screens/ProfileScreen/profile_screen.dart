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
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              switch (state) {
                case ProfileLoading():
                  return const Center(child: CircularProgressIndicator());
                case ProfileError():
                  return Center(child: Text('Ошибка: ${state.errorMessage}'));
                case ProfileLoaded():
                  final user = state.userProfile;

                  final tournamentCount = user.entries.length;
                  final winsCount = 0;
                  final winrate = tournamentCount > 0
                      ? ((winsCount / tournamentCount) * 100).toStringAsFixed(0)
                      : '0';
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTop(context),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView(
                          children: [
                            _buildHeader(user),
                            const SizedBox(height: 24),

                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: CardStatistics(
                                      title: 'Турниров',
                                      value: '$tournamentCount',
                                      color: AppColors.blueColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: CardStatistics(
                                      title: 'Побед',
                                      value: '$winsCount',
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: CardStatistics(
                                      title: 'Winrate',
                                      value: '$winrate%',
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),
                            if (user.role == UserRole.manager ||
                                user.role == UserRole.admin) ...[
                              CardSetting(
                                icon: LucideIcons.box,
                                title: 'Панель Организатора',
                                onTap: () {
                                  if (user.role == UserRole.manager) {
                                    context.push('/manager-dashboard');
                                  }
                                  if (user.role == UserRole.admin) {
                                    context.push('/admin-dashboard');
                                  }
                                },
                              ),
                              const SizedBox(height: 16),
                            ],
                            CardSetting(
                              icon: LucideIcons.bell,
                              title: 'Уведомления',
                              onTap: () => context.push('/notifications'),
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.userCog,
                              title: 'Редактировать профиль',
                              onTap: () =>
                                  context.push('/profile/edit', extra: user),
                            ),
                            const SizedBox(height: 16),

                            CardSetting(
                              icon: LucideIcons.keyRound,
                              title: 'Сменить пароль',
                              onTap: () => context.push('/change-password'),
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.heartHandshake,
                              title: 'Служба поддержки',
                              onTap: () => _showInfoDialog(
                                context,
                                'Поддержка',
                                'Напишите нам: support@cyber.club\nИли звоните: 8-800-555-35-35',
                              ),
                            ),
                            const SizedBox(height: 16),
                            CardSetting(
                              icon: LucideIcons.info,
                              title: 'О приложении',
                              onTap: () => _showInfoDialog(
                                context,
                                'CyberClub Tournaments 0.0.1',
                                'Лучшее приложение для киберспортивных турниров.\nРазработано в рамках курсового проекта.',
                              ),
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
          elevation: 4,
          color: AppColors.bgSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.bgMain, width: 1),
          ),
          offset: const Offset(0, 50),
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
              value: 'leave',
              child: Row(
                children: [
                  Icon(
                    LucideIcons.fireExtinguisher,
                    size: 20,
                    color: AppColors.redColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Выйти из аккаунта',
                    style: AppTextStyles.bodyM.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(UserProfileModel user) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 72,
          backgroundImage: user.avatarUrl != null
              ? NetworkImage(user.avatarUrl!)
              : null,
          child: user.avatarUrl != null
              ? null
              : const Icon(
                  LucideIcons.circleUserRound,
                  size: 80,
                  color: AppColors.textSecondary,
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.nickname,
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text('${user.bio}'),
            ],
          ),
        ),
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
              style: TextStyle(color: AppColors.redColor),
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

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Сменить пароль'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPasswordController,
              decoration: const InputDecoration(labelText: 'Старый пароль'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(labelText: 'Новый пароль'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ProfileBloc>().add(
                ProfilePasswordChangeRequested(
                  oldPassword: oldPasswordController.text,
                  newPassword: newPasswordController.text,
                ),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String text) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(text, style: AppTextStyles.bodyL),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('ОК'),
          ),
        ],
      ),
    );
  }
}
