import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../core/constant/app_assets.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import 'multi_product_order_card.dart';

class OrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  final OrderStatus type;
  const OrdersList({super.key, required this.orders, required this.type});

  @override
  Widget build(BuildContext context) {
    final isOrdersEmpty = orders.isEmpty;
    final ordersList = ListView.separated(
      padding: EdgeInsets.all(context.spaces.s24.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => context.spaces.s16.verticalSpace,
      itemBuilder: (context, index) {
        return MultiProductOrderCard(order: orders[index]);
      },
    );

    return isOrdersEmpty
        ? Column(
            spacing: context.spaces.s24.h,
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                AppAssets.emptyBox,
                width: context.spaces.s64.w,
                height: context.spaces.s64.h,
              ),
              Column(
                spacing: context.spaces.s8.h,
                children: [
                  Text(
                    AppStrings.noOrdersTitle(type.name),
                    style: context.typography.h4Medium,
                  ),

                  Text(
                    AppStrings.noOrdersDescription(type.name),
                    style: context.typography.b1Regular.copyWith(
                      color: context.colors.primary500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          )
        : ordersList;
  }
}
