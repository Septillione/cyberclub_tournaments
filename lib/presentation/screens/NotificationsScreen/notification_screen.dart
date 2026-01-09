import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/repositories/notification_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/NotificationsScreen/bloc/notification_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/NotificationsScreen/widgets/notification_item.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(
        notificationRepository: context.read<NotificationRepository>(),
      )..add(NotificationStarted()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                switch (state) {
                  case NotificationLoading():
                    return const Center(child: CircularProgressIndicator());
                  case NotificationError():
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
                            onPressed: () => context
                                .read<NotificationBloc>()
                                .add(NotificationStarted()),
                            child: const Text('Попробовать снова'),
                          ),
                        ],
                      ),
                    );
                  case NotificationLoaded():
                    if (state.notifications.isEmpty) {
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
                            Text(
                              'Нет новых уведомлений',
                              style: AppTextStyles.h3,
                            ),
                          ],
                        ),
                      );
                    }

                    return RefreshIndicator(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                CustomBackButton(),
                                Center(
                                  child: Text(
                                    'Уведомления',
                                    style: AppTextStyles.h2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 32),

                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return NotificationItem(
                                  notification: state.notifications[index],
                                );
                              },
                              separatorBuilder: (_, __) => const Divider(
                                height: 1,
                                color: AppColors.bgMain,
                              ),
                              itemCount: state.notifications.length,
                            ),
                          ),
                        ],
                      ),
                      onRefresh: () async {
                        context.read<NotificationBloc>().add(
                          NotificationRefreshed(),
                        );
                        await Future.delayed(const Duration(seconds: 1));
                      },
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
