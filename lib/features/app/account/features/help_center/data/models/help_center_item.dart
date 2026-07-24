import 'package:flutter/material.dart';

enum HelpCenterItemId {
  customerService,
  whatsapp,
  website,
  facebook,
  twitter,
  instagram,
}

class HelpCenterItem {
  const HelpCenterItem({
    required this.icon,
    required this.title,
    required this.id,
  });

  final HelpCenterItemId id;
  final IconData icon;
  final String title;
}
