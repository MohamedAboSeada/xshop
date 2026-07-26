import 'package:flutter/material.dart';
import '../../domain/entities/order_model.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderStatus status;

  const OrderStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case OrderStatus.ongoing:
        backgroundColor = context.colors.warning.withValues(alpha: 0.12);
        textColor = context.colors.warning;
        break;
      case OrderStatus.dispatched:
        backgroundColor = context.colors.primary500.withValues(alpha: 0.12);
        textColor = context.colors.primary500;
        break;
      case OrderStatus.completed:
        backgroundColor = context.colors.success.withValues(alpha: 0.12);
        textColor = context.colors.success;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spaces.s8,
        vertical: context.spaces.s4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(context.spaces.s100),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: context.typography.b3Medium.copyWith(color: textColor),
      ),
    );
  }
}
