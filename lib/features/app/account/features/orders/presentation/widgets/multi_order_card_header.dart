import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'order_status_badge.dart';

class MultiOrderCardHeader extends StatelessWidget {
  const MultiOrderCardHeader({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.spaces.s16.w,
        vertical: context.spaces.s12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.orderId, style: context.typography.b2Semibold),
              Text(
                AppStrings.totalAmount(order.totalPrice),
                style: context.typography.b3Regular.copyWith(
                  color: context.colors.primary500,
                ),
              ),
            ],
          ),
          Skeleton.leaf(child: OrderStatusBadge(status: order.status)),
        ],
      ),
    );
  }
}
