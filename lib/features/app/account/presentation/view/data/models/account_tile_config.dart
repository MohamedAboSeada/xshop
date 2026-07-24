import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum AccountTileId {
  myOrders,
  myDetails,
  addressBook,
  paymentMethods,
  notifications,
  languages,
  faqs,
  helpCenter,
  logout,
}

class AccountTileConfig {
  final AccountTileId id;
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color? foregroundColor;

  const AccountTileConfig({
    required this.id,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = LucideIcons.chevronRight,
    this.foregroundColor,
  });
}
