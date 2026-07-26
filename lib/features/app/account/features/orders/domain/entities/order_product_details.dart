class OrderProductDetails {
  final String id;
  final String? image;
  final num price;
  final String name;
  final String size;

  const OrderProductDetails({
    required this.image,
    required this.name,
    required this.price,
    required this.size,
    required this.id,
  });
}
