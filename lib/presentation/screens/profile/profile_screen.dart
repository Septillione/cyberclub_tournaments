import 'package:cyberclub_tournaments/core/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_bloc.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/card_setting.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/profile_header.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/profile_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return switch (state) {
                ProfileLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                ProfileError(:final errorMessage) => Center(
                  child: Text('Ошибка: $errorMessage'),
                ),
                ProfileLoaded(:final userProfile) => Column(
                  children: [
                    _TopBar(),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ListView(
                        children: [
                          ProfileHeader(user: userProfile),
                          const SizedBox(height: 24),
                          ProfileStats(stats: userProfile.stats),
                          const SizedBox(height: 24),
                          _SettingsList(user: userProfile),
                        ],
                      ),
                    ),
                  ],
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Профиль', style: AppTextStyles.h2),
        PopupMenuButton<String>(
          elevation: 4,
          color: AppColors.bgSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.bgMain, width: 1),
          ),
          offset: const Offset(0, 50),
          icon: const Icon(
            LucideIcons.settings,
            size: 24,
            color: AppColors.textSecondary,
          ),
          onSelected: (value) {
            if (value == 'leave') _onLogout(context);
          },
          itemBuilder: (_) => [
            PopupMenuItem(
              value: 'leave',
              child: Row(
                children: [
                  const Icon(
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

  void _onLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AuthBloc>().add(AuthLogoutRequested());
            },
            child: const Text(
              'Выйти',
              style: TextStyle(color: AppColors.redColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsList extends StatelessWidget {
  final UserEntity user;

  const _SettingsList({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (user.role == UserRole.manager || user.role == UserRole.admin)
          _buildAdminPanel(context),
        CardSetting(
          icon: LucideIcons.bell,
          title: 'Уведомления',
          onTap: () => context.push('/notifications'),
        ),
        const SizedBox(height: 16),
        CardSetting(
          icon: LucideIcons.userCog,
          title: 'Редактировать профиль',
          onTap: () => context.push('/profile/edit', extra: {'user': user}),
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
          onTap: () => _showInfo(
            context,
            'Поддержка',
            'Напишите нам: support@cyber.club',
          ),
        ),
        const SizedBox(height: 16),
        CardSetting(
          icon: LucideIcons.info,
          title: 'О приложении',
          onTap: () => _showInfo(
            context,
            'CyberClub Tournaments 0.0.1',
            'Разработано в рамках курсового проекта.',
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildAdminPanel(BuildContext context) {
    return Column(
      children: [
        CardSetting(
          icon: LucideIcons.box,
          title: 'Панель Организатора',
          onTap: () {
            if (user.role == UserRole.manager) {
              context.push('/manager-dashboard');
            } else {
              context.push('/admin-dashboard');
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showInfo(BuildContext context, String title, String text) {
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
