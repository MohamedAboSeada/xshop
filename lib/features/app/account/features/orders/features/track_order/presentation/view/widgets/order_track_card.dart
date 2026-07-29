import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';

class OrderTrackCard extends StatelessWidget {
  final String orderId;
  final String estimatedTime;

  const OrderTrackCard({
    super.key,
    required this.orderId,
    required this.estimatedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: context.borders.moreMutedBorder.toBorderSide(),
        borderRadius: .all(context.radius.r10),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.spaces.s12.r),
        child: Row(
          spacing: context.spaces.s12.w,
          children: [
            const Skeleton.leaf(
              child: CircleAvatar(child: Icon(LucideIcons.van)),
            ),
            Expanded(
              child: Column(
                spacing: context.spaces.s4.h,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    AppStrings.orderNumber(orderId),
                    style: context.typography.b1Semibold,
                  ),
                  Text(
                    AppStrings.estimatedArrivalTime(estimatedTime),
                    style: context.typography.b2Regular.copyWith(
                      color: context.colors.primary400,
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
