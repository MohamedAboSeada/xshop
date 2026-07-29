import 'package:flutter/material.dart';
import '../widgets/order_cards_loading_skeleton.dart';
import '../../domain/entities/mock_order_data.dart';
import '../widgets/orders_list.dart';
import '../widgets/orders_tab_bar.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(title: AppStrings.myOrders),
        body: Column(
          children: [
            const OrdersTabBar(),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Ongoing Orders
                  const OrderCardsLoadingSkeleton(status: .ongoing),

                  // Dispatched Orders
                  OrdersList(
                    orders: MockOrderData.dispatchedOrders,
                    type: .dispatched,
                  ),

                  // Completed Orders
                  const OrdersList(orders: [], type: .completed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
