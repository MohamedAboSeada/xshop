import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../../core/constant/app_strings.dart';
import '../../../domain/entities/shipping_info.dart';

import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../../../../core/widgets/custom_app_bar.dart';
import '../../../domain/entities/mock_steps.dart';
import '../../../domain/entities/tracking_step.dart';
import '../widgets/order_track_card.dart';
import '../widgets/report_issue_card.dart';
import '../widgets/shipping_info_card.dart';
import '../widgets/shipping_status.dart';

class TrackOrderScreen extends StatelessWidget {
  final String orderId;
  const TrackOrderScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    const trackingSteps = MockSteps.trackingSteps;

    int currentStepIndex = trackingSteps.indexWhere(
      (step) => step.status == TrackingStatus.current,
    );

    if (currentStepIndex == -1) {
      currentStepIndex =
          trackingSteps.every((s) => s.status == TrackingStatus.completed)
          ? trackingSteps.length - 1
          : -1;
    }

    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.trackOrder),
      body: CustomScrollView(
        slivers: [
          Skeletonizer.sliver(
            enabled: false,
            child: SliverPadding(
              padding: EdgeInsets.all(context.spaces.s24.r),
              sliver: SliverMainAxisGroup(
                slivers: [
                  /// Order track info card
                  SliverToBoxAdapter(
                    child: OrderTrackCard(
                      orderId: orderId,
                      estimatedTime: "Today, 04:00 PM",
                    ),
                  ),

                  SliverToBoxAdapter(child: context.spaces.s12.verticalSpace),

                  /// Order report card
                  SliverToBoxAdapter(
                    child: ReportIssueCard(onReportTap: () {}),
                  ),

                  SliverToBoxAdapter(child: context.spaces.s24.verticalSpace),

                  /// Order Status step indicators
                  SliverToBoxAdapter(
                    child: Text(
                      AppStrings.orderStatus,
                      style: context.typography.h4,
                    ),
                  ),

                  SliverToBoxAdapter(child: context.spaces.s20.verticalSpace),

                  ShippingStatus(
                    trackingSteps: trackingSteps,
                    currentStepIndex: currentStepIndex,
                  ),

                  SliverToBoxAdapter(child: context.spaces.s4.verticalSpace),

                  /// Shipping Information Card
                  SliverToBoxAdapter(
                    child: ShippingInfoCard(
                      info: ShippingInfo(
                        shippingCompany: "Aramex",
                        trackingNumber: "ARX987654321",
                      ),
                      onCopyTap: (trackingNumber) {
                        debugPrint(trackingNumber);
                      },
                      onViewWebsiteTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
