import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';

class TournamentSkeletonCard extends StatelessWidget {
  const TournamentSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Shimmer.fromColors(
        baseColor: AppColors.bgSurface,
        highlightColor: AppColors.bgSurface.withOpacity(0.5).withBlue(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SkeletonBar(width: double.infinity, height: 24),
                  const SizedBox(height: 12),
                  _SkeletonBar(width: 100, height: 20),
                  const SizedBox(height: 16),
                  _SkeletonBar(width: 200, height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkeletonBar extends StatelessWidget {
  final double width;
  final double height;

  const _SkeletonBar({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
