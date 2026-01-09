import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TournamentSkeletonCard extends StatelessWidget {
  const TournamentSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.bgSurface, // Цвет "покоя" (фон карточки)
      highlightColor: AppColors.bgSurface
          .withOpacity(0.5)
          .withBlue(60), // Цвет "блика" (чуть светлее)
      // Или классический вариант для темной темы:
      // baseColor: Colors.grey[800]!,
      // highlightColor: Colors.grey[700]!,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          // Важно: для Shimmer контейнер должен иметь цвет,
          // чтобы эффект был виден (любой, хоть черный)
          // color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Имитация Картинки
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Цвет здесь не важен, главное наличие
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.0),
                  ),
                ),
              ),
            ),

            // 2. Имитация Инфо-блока
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок (широкая полоска)
                  Container(
                    width: double.infinity,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Статус (короткая полоска)
                  Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Метаданные (средняя полоска)
                  Container(
                    width: 200,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
