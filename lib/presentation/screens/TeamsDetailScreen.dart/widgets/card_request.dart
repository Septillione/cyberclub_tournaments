import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
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
          Row(
            children: [
              // CircleAvatar(
              //   backgroundImage: user.avatarUrl != null
              //       ? NetworkImage(user.avatarUrl!)
              //       : null,
              //   radius: 20,
              // ),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.bgMain,
                backgroundImage: user.avatarUrl != null
                    ? NetworkImage(user.avatarUrl!)
                    : null,
                child: user.avatarUrl == null
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
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButtonApplication(onAccept, 'Принять', true),
              const SizedBox(width: 16),
              _buildButtonApplication(onReject, 'Отклонить', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonApplication(Function() onTap, String title, bool accept) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: accept == true ? null : AppColors.bgSurface,
            borderRadius: BorderRadius.circular(12.0),
            gradient: accept == true
                ? LinearGradient(
                    colors: [AppColors.gradientDark, AppColors.gradientLight],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            border: accept == true
                ? null
                : Border.all(color: AppColors.redColor, width: 1.2),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.button.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
