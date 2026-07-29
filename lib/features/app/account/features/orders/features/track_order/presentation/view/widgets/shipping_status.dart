import 'package:flutter/material.dart';
import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../domain/entities/tracking_step.dart';
import 'step_indicator.dart';

class ShippingStatus extends StatelessWidget {
  const ShippingStatus({
    super.key,
    required this.trackingSteps,
    required this.currentStepIndex,
  });

  final List<TrackingStep> trackingSteps;
  final int currentStepIndex;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: trackingSteps.length,
      itemBuilder: (context, index) {
        final step = trackingSteps[index];

        return StepIndicator(
          index: index,
          currentIndex: currentStepIndex,
          totalSteps: trackingSteps.length,
          stepTitle: Text(step.title, style: context.typography.b1Semibold),
          content: Text(
            step.time,
            style: context.typography.b2Regular.copyWith(
              color: context.colors.primary400,
            ),
          ),
        );
      },
    );
  }
}
