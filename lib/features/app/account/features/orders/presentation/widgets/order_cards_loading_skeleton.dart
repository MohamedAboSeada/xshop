import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../domain/entities/order_details.dart';
import '../../domain/entities/order_product_details.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'multi_product_order_card.dart';

class OrderCardsLoadingSkeleton extends StatelessWidget {
  final OrderStatus status;
  const OrderCardsLoadingSkeleton({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      3,
      (index) => MultiProductOrderCard(
        order: OrderModel(
          orderId: "XXXXXXXXX",
          status: status,
          items: [
            const OrderDetails(
              quantity: 99,
              details: OrderProductDetails(
                id: "PRD-99999",
                image: "https://example.com/placeholder.png",
                name: "Placeholder Product Name",
                price: 9999.99,
                size: "XXL",
              ),
            ),
          ],
        ),
      ),
    );

    return Skeletonizer(
      ignorePointers: false,
      child: ListView.separated(
        padding: EdgeInsets.all(context.spaces.s24.w),
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (BuildContext context, int index) =>
            context.spaces.s12.verticalSpace,
        itemCount: items.length,
      ),
    );
  }
}
