import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:xshop/core/constant/app_strings.dart';

import '../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../core/theme/tokens/theme_extensions.dart';
import '../data/models/account_tile_config.dart';
import '../widgets/account_section.dart';
import '../widgets/logout_dialog.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const _accountSections = [
    [
      AccountTileConfig(
        title: AppStrings.myOrders,
        leadingIcon: LucideIcons.package,
      ),
    ],
    [
      AccountTileConfig(
        title: AppStrings.myDetails,
        leadingIcon: LucideIcons.badgeInfo,
      ),
      AccountTileConfig(
        title: AppStrings.addressBook,
        leadingIcon: LucideIcons.house,
      ),
      AccountTileConfig(
        title: AppStrings.paymentMethods,
        leadingIcon: LucideIcons.creditCard,
      ),
      AccountTileConfig(
        title: AppStrings.notifications,
        leadingIcon: LucideIcons.bell,
      ),
      AccountTileConfig(
        title: AppStrings.languages,
        leadingIcon: LucideIcons.globe,
      ),
    ],
    [
      AccountTileConfig(
        title: AppStrings.faqs,
        leadingIcon: LucideIcons.circleHelp,
      ),
      AccountTileConfig(
        title: AppStrings.helpCenter,
        leadingIcon: LucideIcons.headset,
      ),
    ],
    [
      AccountTileConfig(
        title: AppStrings.logout,
        leadingIcon: LucideIcons.logOut,
        foregroundColor: Colors.red,
      ),
    ],
  ];

  void _onTilePressed(BuildContext context, AccountTileConfig config) {
    switch (config.title) {
      case AppStrings.logout:
        _showLogoutDialog(context);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.account, style: context.typography.h4),
        titleSpacing: context.spaces.s24.w,
        shape: Border(bottom: context.borders.moreMutedBorder.toBorderSide()),
      ),
      body: CustomScrollView(
        slivers: [
          for (var i = 0; i < _accountSections.length; i++)
            AccountSection(
              items: _accountSections[i],
              showTopSpacing: i != 0,
              onTilePressed: _onTilePressed,
            ),
        ],
      ),
    );
  }
}
