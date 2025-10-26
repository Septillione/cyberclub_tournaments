import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SegmentedButtonDetails extends StatefulWidget {
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
  State<SegmentedButtonDetails> createState() => _SegmentedButtonDetailsState();
}

class _SegmentedButtonDetailsState extends State<SegmentedButtonDetails> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double widgetWidth = constraints.maxWidth;
        final double segmentedWidth = widgetWidth / widget.segments.length;

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
                left: _selectedIndex * segmentedWidth,
                child: Container(
                  width: segmentedWidth,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(widget.segments.length, (index) {
                  final bool isSelected = _selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        widget.onSegmentTapped(index);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          style: AppTextStyles.button.copyWith(
                            color: isSelected
                                ? AppColors.bgMain
                                : AppColors.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            widget.segments[index],
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
