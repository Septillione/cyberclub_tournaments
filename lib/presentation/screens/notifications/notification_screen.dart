import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/notifications/bloc/notification_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/notifications/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<NotificationBloc>()..add(NotificationStarted()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                return switch (state) {
                  NotificationLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  NotificationError() => _ErrorView(
                    onRetry: () => context.read<NotificationBloc>().add(
                      NotificationStarted(),
                    ),
                  ),
                  NotificationLoaded(:final notifications) =>
                    notifications.isEmpty
                        ? const _EmptyView()
                        : _NotificationsList(notifications: notifications),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationsList extends StatelessWidget {
  final List<NotificationEntity> notifications;

  const _NotificationsList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationBloc>().add(NotificationRefreshed());
      },
      child: Column(
        children: [
          const _Header(),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: AppColors.bgMain),
              itemBuilder: (context, index) {
                return NotificationItem(notification: notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          const CustomBackButton(),
          Center(child: Text('Уведомления', style: AppTextStyles.h2)),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.wifiOff,
            size: 48,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: 16),
          Text('Ошибка загрузки', style: AppTextStyles.h3),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onRetry,
            child: const Text('Попробовать снова'),
          ),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.bellOff,
            size: 64,
            color: AppColors.textDisabled,
          ),
          const SizedBox(height: 16),
          Text('Нет новых уведомлений', style: AppTextStyles.h3),
        ],
      ),
    );
  }
}
