import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'multi_product_order_card.dart';

class OrderCardsLoadingSkeleton extends StatelessWidget {
  const OrderCardsLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      5,
      (index) => const MultiProductOrderCard(
        order: OrderModel(orderId: "", status: .ongoing, items: []),
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
