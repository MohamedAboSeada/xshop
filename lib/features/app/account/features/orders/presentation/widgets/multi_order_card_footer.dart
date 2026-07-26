import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../../../core/constant/app_assets.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../core/widgets/action_button.dart';
import '../../../../../../../core/widgets/app_dialog.dart';
import '../../domain/entities/order_model.dart';
import 'order_review_section.dart';

class MultiOrderCardFooter extends StatelessWidget {
  final OrderModel order;

  const MultiOrderCardFooter({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final bool isOngoing = order.status == OrderStatus.ongoing;
    final bool isDispatched = order.status == OrderStatus.dispatched;
    final bool isCompleted = order.status == OrderStatus.completed;

    return Padding(
      padding: EdgeInsets.all(context.spaces.s12.r),
      child: Builder(
        builder: (context) {
          if (isOngoing) {
            return Column(
              spacing: context.spaces.s8.h,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ActionButton(
                  label: AppStrings.trackOrder,
                  onPressed: () {},
                  icon: LucideIcons.map,
                  alignment: .start,
                ),
                ActionButton(
                  label: AppStrings.cancelOrder,
                  type: ButtonType.danger,
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AppDialog(
                        iconAsset: AppAssets.warning,
                        title: AppStrings.cancelOrderTitle,
                        subtitle: AppStrings.cancelOrderSubtitle,
                        primaryButtonLabel: AppStrings.yesCancel,
                        primaryButtonType: ButtonType.danger,
                        onPrimaryPressed: () {},
                        secondaryButtonLabel: AppStrings.no,
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (isDispatched) {
            return ActionButton(
              label: AppStrings.trackOrder,
              onPressed: () {},
              icon: LucideIcons.map,
              alignment: .start,
            );
          } else if (isCompleted) {
            return OrderReviewSection(rating: order.review);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
