import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';

class StepIndicatorStyle {
  final double indicatorSize;
  final double borderWidth;
  final double innerCircleFactor;
  final double lineThickness;
  final double spacing;
  final EdgeInsets contentPadding;

  const StepIndicatorStyle({
    this.indicatorSize = 20.0,
    this.borderWidth = 2.0,
    this.innerCircleFactor = 0.6,
    this.lineThickness = 2.0,
    this.spacing = 12.0,
    this.contentPadding = const EdgeInsets.only(top: 8.0, bottom: 20.0),
  });
}

class StepIndicator extends StatelessWidget {
  final StepIndicatorStyle style;
  final int index;
  final int currentIndex;
  final int totalSteps;
  final Widget? stepTitle;
  final Widget? content;

  const StepIndicator({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.totalSteps,
    this.stepTitle,
    this.content,
    StepIndicatorStyle? indicatorStyle,
  }) : style = indicatorStyle ?? const StepIndicatorStyle();

  @override
  Widget build(BuildContext context) {
    final isCompleted = index <= currentIndex;
    final isLastStep = index == totalSteps - 1;
    final isLineActive = index < currentIndex;

    final stepBorders = isCompleted
        ? context.borders.focusedBorder.withWidth(style.borderWidth)
        : context.borders.mutedBorder.withWidth(style.borderWidth);

    final innerStep = isCompleted
        ? FractionallySizedBox(
            widthFactor: style.innerCircleFactor,
            heightFactor: style.innerCircleFactor,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.primary900,
              ),
            ),
          )
        : const SizedBox();

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: style.indicatorSize,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!isLastStep)
                  Positioned(
                    top: style.indicatorSize,
                    bottom: 0,
                    child: Skeleton.leaf(
                      child: DottedLine(
                        direction: Axis.vertical,
                        dashColor: isLineActive
                            ? context.colors.primary900
                            : context.colors.primary500,
                        lineThickness: style.lineThickness,
                      ),
                    ),
                  ),
                Skeleton.leaf(
                  child: SizedBox(
                    width: style.indicatorSize,
                    height: style.indicatorSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: stepBorders,
                        shape: BoxShape.circle,
                        color: context.colors.primary0,
                      ),
                      child: innerStep,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: style.spacing),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: style.indicatorSize,
                  alignment: Alignment.centerLeft,
                  child: stepTitle ?? const SizedBox(),
                ),
                if (content != null)
                  Padding(padding: style.contentPadding, child: content!)
                else if (!isLastStep)
                  Padding(
                    padding: style.contentPadding,
                    child: const SizedBox(height: 10),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
