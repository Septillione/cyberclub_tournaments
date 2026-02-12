import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BanScreen extends StatelessWidget {
  final String banMessage;

  const BanScreen({super.key, required this.banMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.shieldBan, size: 80, color: AppColors.redColor),
            const SizedBox(height: 24),
            Text(
              'Доступ ограничен',
              style: AppTextStyles.h1.copyWith(color: AppColors.redColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgSurface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.redColor.withOpacity(0.3)),
              ),
              child: Text(
                banMessage.isNotEmpty
                    ? banMessage
                    : 'Ваш аккаунт был заблокирован администрацией за нарушение правил сообщества.',
                style: AppTextStyles.bodyL,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Перенаправляем на логин, чтобы можно было зайти под другим аккаунтом
                // или попробовать снова (если бан временный и истек)
                context.go('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bgSurface,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text('Вернуться на экран входа'),
            ),
          ],
        ),
      ),
    );
  }
}
