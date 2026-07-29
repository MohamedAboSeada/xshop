import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../../../../core/widgets/action_button.dart';

class ReportIssueCard extends StatelessWidget {
  final VoidCallback onReportTap;

  const ReportIssueCard({super.key, required this.onReportTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.spaces.s16),
      decoration: BoxDecoration(
        color: context.colors.danger.withValues(alpha: 0.05),
        borderRadius: BorderRadius.all(context.radius.r10),
        border: context.borders.errorBorder,
      ),

      child: Row(
        children: [
          Skeleton.leaf(
            child: Container(
              padding: EdgeInsets.all(context.spaces.s10),
              decoration: BoxDecoration(
                color: context.colors.danger.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline_rounded,
                color: context.colors.danger,
                size: context.spaces.s24,
              ),
            ),
          ),
          context.spaces.s16.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.orderDelayed,
                  style: context.typography.b1Semibold.copyWith(
                    color: context.colors.danger,
                  ),
                ),
                context.spaces.s4.verticalSpace,
                Text(
                  AppStrings.orderDelayedSubtitle,
                  style: context.typography.b3Regular.copyWith(
                    color: context.colors.danger.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),

          context.spaces.s12.horizontalSpace,

          ActionButton(
            label: AppStrings.report,
            type: .danger,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
