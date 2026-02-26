import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/notifications/bloc/notification_bloc.dart';

class NotificationItem extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final requestId = notification.requestId;
    final showButtons = notification.isInvite && requestId != null;

    return Container(
      color: notification.isRead ? AppColors.bgMain : AppColors.bgSurface,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NotificationHeader(notification: notification),
          if (showButtons) _ActionButtons(requestId: requestId!),
        ],
      ),
    );
  }
}

class _NotificationHeader extends StatelessWidget {
  final NotificationEntity notification;

  const _NotificationHeader({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NotificationIcon(type: notification.type),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notification.title,
                    style: AppTextStyles.h3.copyWith(fontSize: 16),
                  ),
                  Text(
                    DateFormat(
                      'dd.MM В HH:mm',
                      'ru',
                    ).format(notification.createdAt),
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                notification.body,
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  final NotificationType type;

  const _NotificationIcon({required this.type});

  @override
  Widget build(BuildContext context) {
    final (icon, color) = _getIconAndColor(type);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  (IconData, Color) _getIconAndColor(NotificationType type) {
    return switch (type) {
      NotificationType.invite => (LucideIcons.mail, AppColors.accentPrimary),
      NotificationType.match => (LucideIcons.swords, AppColors.redColor),
      NotificationType.system => (LucideIcons.settings, AppColors.greyColor),
      NotificationType.info => (LucideIcons.info, AppColors.greenColor),
    };
  }
}

class _ActionButtons extends StatelessWidget {
  final String requestId;

  const _ActionButtons({required this.requestId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 40),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentPrimary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onPressed: () {
                context.read<NotificationBloc>().add(
                  NotificationAcceptInvite(requestId),
                );
              },
              child: const Text('Принять'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.redColor),
                foregroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              onPressed: () {
                context.read<NotificationBloc>().add(
                  NotificationDeclineInvite(requestId),
                );
              },
              child: const Text('Отклонить'),
            ),
          ),
        ],
      ),
    );
  }
}
