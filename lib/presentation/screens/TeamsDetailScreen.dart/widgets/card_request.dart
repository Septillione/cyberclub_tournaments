import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/JoinRequestModel/join_request_model.dart';
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: user.avatarUrl != null
                    ? NetworkImage(user.avatarUrl!)
                    : null,
                radius: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  user.nickname,
                  style: AppTextStyles.h3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButtonApplication(
                onAccept,
                AppColors.greenColor,
                'Принять',
              ),
              const SizedBox(width: 64),
              _buildButtonApplication(
                onReject,
                AppColors.redColor,
                'Отклонить',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonApplication(Function() onTap, Color color, String title) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(child: Text(title, style: AppTextStyles.button)),
        ),
      ),
    );
    //   return ElevatedButton(
    //     // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: color,
    //       elevation: 0,
    //       minimumSize: const Size.fromHeight(44),
    //     ),
    //     onPressed: onTap,
    //     child: Text(title, style: AppTextStyles.button),
    //   );
    // }
  }
}
