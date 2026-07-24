import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/tokens/theme_extensions.dart';
import '../data/models/account_tile_config.dart';

class AccountTile extends StatelessWidget {
  final AccountTileConfig config;
  final VoidCallback onTap;

  const AccountTile({super.key, required this.config, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: context.spaces.s64.h,
      contentPadding: EdgeInsets.symmetric(horizontal: context.spaces.s24.w),
      onTap: onTap,
      leading: Icon(config.leadingIcon, color: config.foregroundColor),
      title: Text(
        config.title,
        style: context.typography.b1Medium.copyWith(
          color: config.foregroundColor,
        ),
      ),
      trailing: (config.foregroundColor == null)
          ? Icon(config.trailingIcon)
          : null,
    );
  }
}
