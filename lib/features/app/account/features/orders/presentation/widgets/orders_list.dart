import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'multi_product_order_card.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  const OrdersList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(context.spaces.s24.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => context.spaces.s16.verticalSpace,
      itemBuilder: (context, index) {
        return MultiProductOrderCard(order: orders[index]);
      },
    );
  }
}
