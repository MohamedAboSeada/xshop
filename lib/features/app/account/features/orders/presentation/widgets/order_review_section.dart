import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../core/widgets/action_button.dart';
import 'review_modal_sheet.dart';

class OrderReviewSection extends StatelessWidget {
  final String? rating;

  const OrderReviewSection({super.key, this.rating});

  @override
  Widget build(BuildContext context) {
    if (rating != null && rating!.isNotEmpty) {
      return SizedBox(
        height: context.spaces.s40.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(context.radius.r8),
            side: context.borders.moreMutedBorder.toBorderSide(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.s16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: context.colors.warning,
                  size: context.spaces.s20.r,
                ),
                SizedBox(width: context.spaces.s4.w),
                Text("$rating / 5.0", style: context.typography.b2Semibold),
              ],
            ),
          ),
        ),
      );
    }

    return ActionButton(
      label: AppStrings.leaveReview,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: context.radius.r20),
          ),
          isDismissible: false,
          context: context,
          builder: (context) => DraggableScrollableSheet(
            expand: false,
            minChildSize: 0.5,
            maxChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return const ReviewModalSheet();
            },
          ),
        );
      },
    );
  }
}
