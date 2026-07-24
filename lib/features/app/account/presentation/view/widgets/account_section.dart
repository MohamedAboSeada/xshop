import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/tokens/theme_extensions.dart';
import '../data/models/account_tile_config.dart';
import 'account_tile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
    required this.items,
    this.showTopSpacing = true,
    required this.onTilePressed,
  });

  final void Function(BuildContext context, AccountTileConfig config)
  onTilePressed;
  final List<AccountTileConfig> items;
  final bool showTopSpacing;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        if (showTopSpacing)
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.spaces.s8.h,
              child: ColoredBox(color: context.colors.primary100),
            ),
          ),

        SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (_, _) => const Divider(height: 0),
          itemBuilder: (_, index) => AccountTile(
            config: items[index],
            onTap: () => onTilePressed(context, items[index]),
          ),
        ),
      ],
    );
  }
}
