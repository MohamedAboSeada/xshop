import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xshop/core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../domain/entities/order_details.dart';
import 'order_product_image.dart';

class OrderListItem extends StatelessWidget {
  final OrderDetails item;
  const OrderListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        // context.goNamed(
        //   "productDetails",
        //   pathParameters: {"id": item.details.id},
        // );
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.spaces.s80.w,
              height: context.spaces.s80.h,
              child: OrderProductImage(imageUrl: item.details.image ?? "N/A"),
            ),
            SizedBox(width: context.spaces.s12),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.details.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.typography.b3Semibold,
                      ),
                      SizedBox(height: context.spaces.s4),
                      Text(
                        AppStrings.orderDetailsText(
                          item.details.size,
                          item.quantity as int,
                        ),
                        style: context.typography.b3Regular.copyWith(
                          color: context.colors.primary500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaces.s8),
                  Text(
                    '\$${(item.quantity * item.details.price).toStringAsFixed(2)}',
                    style: context.typography.b2Medium.copyWith(
                      fontWeight: FontWeight.w700,
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
