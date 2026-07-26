import 'order_details.dart';

enum OrderStatus { completed, ongoing, dispatched }

class OrderModel {
  final String orderId;
  final OrderStatus status;
  final List<OrderDetails> items;
  final String? review;

  const OrderModel({
    required this.orderId,
    required this.status,
    required this.items,
    this.review,
  });

  double get totalPrice {
    return items.fold(
      0,
      (sum, item) => sum + (item.details.price * item.quantity),
    );
  }
}
