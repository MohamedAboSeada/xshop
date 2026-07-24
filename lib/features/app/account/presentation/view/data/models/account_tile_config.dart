import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AccountTileConfig {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Color? foregroundColor;

  const AccountTileConfig({
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = LucideIcons.chevronRight,
    this.foregroundColor,
  });
}
