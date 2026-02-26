import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';

class InviteUserCard extends StatelessWidget {
  final TeamUserShort user;
  final VoidCallback onInvite;

  const InviteUserCard({super.key, required this.user, required this.onInvite});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => context.push('/profile/${user.id}'),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _UserAvatar(avatarUrl: user.avatarUrl),
                const SizedBox(width: 16),
                _UserInfo(nickname: user.nickname),
                _InviteButton(onInvite: onInvite),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String? avatarUrl;

  const _UserAvatar({this.avatarUrl});

  static const double _size = 40;

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;

    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bgMain,
        border: Border.all(
          color: AppColors.bgSurface,
          width: 2,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        image: hasImage
            ? DecorationImage(
                image: NetworkImage(avatarUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: !hasImage
          ? const Icon(
              LucideIcons.userRound,
              color: AppColors.textSecondary,
              size: _size * 0.5,
            )
          : null,
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String nickname;

  const _UserInfo({required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nickname,
            style: AppTextStyles.h3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Игрок',
            style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _InviteButton extends StatelessWidget {
  final VoidCallback onInvite;

  const _InviteButton({required this.onInvite});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 36,
      child: GradientButton(text: 'Пригласить', onPressed: onInvite),
    );
  }
}
