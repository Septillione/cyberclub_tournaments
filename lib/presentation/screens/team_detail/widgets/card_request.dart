import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';

class CardRequest extends StatelessWidget {
  final JoinRequestEntity joinRequest;
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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserInfo(user: joinRequest.user),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  title: 'Принять',
                  onTap: onAccept,
                  isPrimary: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ActionButton(
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
}

class _UserInfo extends StatelessWidget {
  final TeamUserShort user;

  const _UserInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Avatar(avatarUrl: user.avatarUrl),
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

class _Avatar extends StatelessWidget {
  final String? avatarUrl;

  const _Avatar({this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.bgMain,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null
          ? const Icon(
              LucideIcons.userRound,
              color: AppColors.textSecondary,
              size: 20,
            )
          : null,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isPrimary;

  const _ActionButton({
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
          borderRadius: BorderRadius.circular(12),
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
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
