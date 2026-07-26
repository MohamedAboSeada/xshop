import 'package:flutter/material.dart';

import '../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../data/models/help_center_item.dart';

class HelpCenterTile extends StatelessWidget {
  final HelpCenterItem item;
  final VoidCallback? onTap;

  const HelpCenterTile({super.key, this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: context.borders.moreMutedBorder.toBorderSide(),
        borderRadius: .all(context.radius.r10),
      ),
      leading: Icon(item.icon),
      title: Text(item.title, style: context.typography.b1Medium),
    );
  }
}
