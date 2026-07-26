import 'order_details.dart';
import 'order_model.dart';
import 'order_product_details.dart';

class MockOrderData {
  static const List<OrderModel> orders = [
    OrderModel(
      orderId: "#ORD-93821",
      status: OrderStatus.ongoing,
      items: [
        OrderDetails(
          quantity: 1,
          details: OrderProductDetails(
            id: "PRD-10001",
            image:
                "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=500&q=80",
            name: "Oversized Cotton T-Shirt",
            price: 29.99,
            size: "L",
          ),
        ),
      ],
    ),

    OrderModel(
      orderId: "#ORD-55421",
      status: OrderStatus.dispatched,
      items: [
        OrderDetails(
          quantity: 2,
          details: OrderProductDetails(
            id: "PRD-10002",
            image:
                "https://images.unsplash.com/photo-1603252109303-2751441dd157?auto=format&fit=crop&w=500&q=80",
            name: "Casual Linen Shirt",
            price: 44.99,
            size: "M",
          ),
        ),
      ],
    ),

    OrderModel(
      orderId: "#ORD-55422",
      status: OrderStatus.completed,
      review: "4.8",
      items: [
        OrderDetails(
          quantity: 1,
          details: OrderProductDetails(
            id: "PRD-10003",
            image:
                "https://images.unsplash.com/photo-1556906781-9a412961c28c?auto=format&fit=crop&w=500&q=80",
            name: "Classic White Hoodie",
            price: 54.99,
            size: "XL",
          ),
        ),
      ],
    ),

    OrderModel(
      orderId: "#ORD-48291",
      status: OrderStatus.completed,
      items: [
        OrderDetails(
          quantity: 1,
          details: OrderProductDetails(
            id: "PRD-10004",
            image:
                "https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=500&q=80",
            name: "Slim Fit Denim Jacket",
            price: 79.99,
            size: "L",
          ),
        ),
        OrderDetails(
          quantity: 2,
          details: OrderProductDetails(
            id: "PRD-10005",
            image:
                "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=500&q=80",
            name: "Regular Fit Jeans",
            price: 59.99,
            size: "32",
          ),
        ),
      ],
    ),
  ];

  static List<OrderModel> get ongoingOrders =>
      orders.where((o) => o.status == OrderStatus.ongoing).toList();

  static List<OrderModel> get dispatchedOrders =>
      orders.where((o) => o.status == OrderStatus.dispatched).toList();

  static List<OrderModel> get completedOrders =>
      orders.where((o) => o.status == OrderStatus.completed).toList();
}
