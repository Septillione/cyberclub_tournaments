import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class OverlappingAvatars extends StatelessWidget {
  final List<String?> avatarUrls;
  final int totalCount;
  final double avatarSize;
  final double overlap;

  const OverlappingAvatars({
    super.key,
    required this.avatarUrls,
    required this.totalCount,
    this.avatarSize = 32.0,
    this.overlap = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = avatarUrls.length;

    return Flexible(
      child: SizedBox(
        height: avatarSize,
        width: (avatarSize * displayCount) - (overlap * (displayCount - 1)),
        child: Stack(
          children: List.generate(displayCount, (index) {
            final avatarUrl = avatarUrls[index];
      
            return Positioned(
              left: index * (avatarSize - overlap),
              child: _buildAvatar(avatarUrl),
            );
          }).reversed.toList(),
        ),
      ),
    );
  }

  Widget _buildAvatar(String? url) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.bgSurface, width: 2.0),
      ),
      child: CircleAvatar(
        radius: avatarSize / 2,
        backgroundColor: AppColors.bgMain,
        backgroundImage: url != null ? NetworkImage(url) : null,
        child: url == null
            ? Icon(
                LucideIcons.userRound,
                color: AppColors.textSecondary,
                size: avatarSize * 0.6,
              )
            : null,
      ),
    );
  }
}
