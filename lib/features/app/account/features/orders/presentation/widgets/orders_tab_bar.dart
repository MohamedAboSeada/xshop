import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';

class OrdersTabBar extends StatelessWidget {
  const OrdersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.spaces.s56.h,
      margin: EdgeInsets.only(
        left: context.spaces.s24.w,
        right: context.spaces.s24.w,
        top: context.spaces.s24.w,
      ),
      padding: EdgeInsets.all(context.spaces.s8.w),
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: context.colors.primary100,
        borderRadius: .all(context.radius.r10),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        splashBorderRadius: .all(context.radius.r6),
        indicatorSize: .tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: context.colors.primary0,
          borderRadius: .all(context.radius.r6),
        ),
        unselectedLabelColor: context.colors.primary400,
        labelStyle: context.typography.b2Medium,
        tabs: const [
          Tab(child: Text(AppStrings.tabOngoing)),
          Tab(child: Text(AppStrings.tabDispatched)),
          Tab(child: Text(AppStrings.tabCompleted)),
        ],
      ),
    );
  }
}
