import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _buildAvatar(user.avatarUrl),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.nickname,
                        style: AppTextStyles.h3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      Text(
                        'Игрок',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 110,
                  height: 36,
                  child: GradientButton(
                    text: 'Пригласить',
                    onPressed: onInvite,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String? url) {
    final hasImage = url != null && url.isNotEmpty;
    const double size = 40.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.bgMain,
        border: Border.all(
          color: AppColors.bgSurface,
          width: 2.0,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        image: hasImage
            ? DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
            : null,
      ),
      child: !hasImage
          ? const Center(
              child: Icon(
                LucideIcons.userRound,
                color: AppColors.textSecondary,
                size: size * 0.5,
              ),
            )
          : null,
    );
  }
}
