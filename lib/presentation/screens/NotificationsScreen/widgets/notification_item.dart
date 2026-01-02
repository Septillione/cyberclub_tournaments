import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/NotificationModel/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: notification.isRead ? AppColors.bgMain : AppColors.bgSurface,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.bgMain,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.textDisabled.withAlpha(2)),
          ),
          child: _buildIcon(notification.type),
        ),
        title: Text(
          notification.title,
          style: AppTextStyles.h3.copyWith(
            fontSize: 16,
            fontWeight: notification.isRead
                ? FontWeight.normal
                : FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.body,
              style: AppTextStyles.bodyM.copyWith(
                color: notification.isRead
                    ? AppColors.textDisabled
                    : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('dd.MM В HH:mm', 'ru').format(notification.createdAt),
              style: AppTextStyles.caption,
            ),
          ],
        ),
        // onTap: () =>
      ),
    );
  }

  Widget _buildIcon(NotificationType type) {
    switch (type) {
      case NotificationType.INVITE:
        return const Icon(
          LucideIcons.mail,
          color: AppColors.accentPrimary,
          size: 20,
        );
      case NotificationType.MATCH:
        return const Icon(
          LucideIcons.swords,
          color: AppColors.statusLive,
          size: 20,
        );
      case NotificationType.SYSTEM:
        return const Icon(
          LucideIcons.info,
          color: AppColors.textPrimary,
          size: 20,
        );
      default:
        return const Icon(
          LucideIcons.bell,
          color: AppColors.textSecondary,
          size: 20,
        );
    }
  }
}
