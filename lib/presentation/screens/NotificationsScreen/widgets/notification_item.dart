import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/NotificationModel/notification_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/NotificationsScreen/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationItem extends StatefulWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool _isActionInProgress = false;
  bool _isActionDone = false;

  @override
  Widget build(BuildContext context) {
    final requestId = widget.notification.data?['requestId'] as String?;
    final showButtons =
        widget.notification.type == NotificationType.INVITE &&
        requestId != null &&
        !_isActionDone;

    return Container(
      color: widget.notification.isRead
          ? AppColors.bgMain
          : AppColors.bgSurface,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIcon(widget.notification.type),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.notification.title,
                          style: AppTextStyles.h3.copyWith(fontSize: 16),
                        ),
                        Text(
                          DateFormat(
                            'dd.MM В HH:mm',
                            'ru',
                          ).format(widget.notification.createdAt),
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.notification.body,
                      style: AppTextStyles.bodyM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
          if (showButtons) ...[
            const SizedBox(height: 16),
            if (_isActionInProgress)
              const Center(child: CircularProgressIndicator())
            else
              Row(
                children: [
                  const SizedBox(width: 40),
                  Expanded(
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
                                NotificationAcceptInvite(requestId!),
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
                                NotificationDeclineInvite(requestId!),
                              );
                            },
                            child: const Text('Отклонить'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ] else if (_isActionDone) ...[
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 40),
              child: Text(
                "Решение отправлено",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ],
        ],
        // leading: Container(
        //   padding: const EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     color: AppColors.bgMain,
        //     shape: BoxShape.circle,
        //     border: Border.all(color: AppColors.textDisabled.withAlpha(2)),
        //   ),
        //   child: _buildIcon(notification.type),
        // ),
        // title: Text(
        //   notification.title,
        //   style: AppTextStyles.h3.copyWith(
        //     fontSize: 16,
        //     fontWeight: notification.isRead
        //         ? FontWeight.normal
        //         : FontWeight.bold,
        //   ),
        // ),
        // subtitle: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const SizedBox(height: 4),
        //     Text(
        //       notification.body,
        //       style: AppTextStyles.bodyM.copyWith(
        //         color: notification.isRead
        //             ? AppColors.textDisabled
        //             : AppColors.textSecondary,
        //       ),
        //     ),
        //     const SizedBox(height: 8),
        //     Text(
        //       DateFormat('dd.MM В HH:mm', 'ru').format(notification.createdAt),
        //       style: AppTextStyles.caption,
        //     ),
        //   ],
        // ),
        // onTap: () =>
      ),
    );
  }

  Widget _buildIcon(NotificationType type) {
    IconData icon;
    Color color;

    switch (type) {
      case NotificationType.INVITE:
        icon = LucideIcons.mail;
        color = AppColors.accentPrimary;
        break;
      case NotificationType.MATCH:
        icon = LucideIcons.swords;
        color = AppColors.redColor;
        break;
      case NotificationType.SYSTEM:
        icon = LucideIcons.settings;
        color = AppColors.greyColor;
        break;
      case NotificationType.INFO:
        icon = LucideIcons.info;
        color = AppColors.greenColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
