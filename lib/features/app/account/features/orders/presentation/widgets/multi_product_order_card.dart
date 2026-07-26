import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/order_model.dart';
import 'multi_order_card_footer.dart';
import 'multi_order_card_header.dart';
import '../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'order_list_item.dart';

class MultiProductOrderCard extends StatelessWidget {
  final OrderModel order;
  const MultiProductOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.primary0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(context.radius.r10),
        side: context.borders.moreMutedBorder.toBorderSide(),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          /// Header: Order ID, Total Price & Status
          MultiOrderCardHeader(order: order),

          Divider(color: context.colors.primary100, height: 1),
          context.spaces.s12.h.verticalSpace,

          /// Items List inside the order
          ...order.items.map(
            (item) => Padding(
              padding: EdgeInsets.only(
                left: context.spaces.s12.w,
                right: context.spaces.s12.w,
                bottom: context.spaces.s12.h,
              ),
              child: OrderListItem(item: item),
            ),
          ),

          Divider(color: context.colors.primary100, height: 1),
          MultiOrderCardFooter(order: order),
        ],
      ),
    );
  }
}
