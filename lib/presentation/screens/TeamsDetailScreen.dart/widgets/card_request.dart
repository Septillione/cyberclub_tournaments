import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CardRequest extends StatelessWidget {
  final JoinRequestModel joinRequest;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const CardRequest({
    super.key,
    required this.joinRequest,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final user = joinRequest.user;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfo(user),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _ActionButtons(
                  title: 'Принять',
                  onTap: onAccept,
                  isPrimary: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ActionButtons(
                  title: 'Отклонить',
                  onTap: onReject,
                  isPrimary: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildUserInfo(TeamUserShort user) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.bgMain,
          backgroundImage:
              (user.avatarUrl != null && user.avatarUrl!.isNotEmpty)
              ? NetworkImage(user.avatarUrl!)
              : null,
          child: (user.avatarUrl == null || user.avatarUrl!.isEmpty)
              ? Icon(
                  LucideIcons.userRound,
                  color: AppColors.textSecondary,
                  size: 20,
                )
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            user.nickname,
            style: AppTextStyles.h3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// Кнопка
class _ActionButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionButtons({
    required this.title,
    required this.onTap,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: isPrimary ? null : AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12.0),
          gradient: isPrimary
              ? const LinearGradient(
                  colors: [AppColors.gradientDark, AppColors.gradientLight],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          border: isPrimary
              ? null
              : Border.all(color: AppColors.redColor, width: 1.2),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          splashColor: isPrimary
              ? Colors.white.withOpacity(0.2)
              : AppColors.redColor.withOpacity(0.1),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppTextStyles.button.copyWith(
                fontSize: 14,
                color: isPrimary ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
