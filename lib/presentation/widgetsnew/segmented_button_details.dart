import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';

class SegmentedButtonDetails extends StatelessWidget {
  final List<String> segments;
  final int initialIndex;
  final ValueChanged<int> onSegmentTapped;

  const SegmentedButtonDetails({
    super.key,
    required this.segments,
    required this.initialIndex,
    required this.onSegmentTapped,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth / segments.length;

        return Container(
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.bgSurface,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: initialIndex * width,
                child: Container(
                  width: width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Row(
                children: List.generate(segments.length, (index) {
                  final isSelected = initialIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onSegmentTapped(index),
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppTextStyles.button.copyWith(
                            color: isSelected
                                ? AppColors.bgMain
                                : AppColors.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          child: Text(
                            segments[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
