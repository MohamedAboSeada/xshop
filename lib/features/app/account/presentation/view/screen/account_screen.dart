import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:xshop/core/constant/app_routes.dart';
import 'package:xshop/core/constant/app_strings.dart';
import 'package:xshop/core/widgets/custom_app_bar.dart';

import '../data/models/account_tile_config.dart';
import '../widgets/account_section.dart';
import '../widgets/logout_dialog.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const _accountSections = [
    [
      AccountTileConfig(
        id: .myOrders,
        title: AppStrings.myOrders,
        leadingIcon: LucideIcons.package500,
      ),
    ],
    [
      AccountTileConfig(
        id: .myDetails,
        title: AppStrings.myDetails,
        leadingIcon: LucideIcons.badgeInfo500,
      ),
      AccountTileConfig(
        id: .addressBook,
        title: AppStrings.addressBook,
        leadingIcon: LucideIcons.mapPin500,
      ),
      AccountTileConfig(
        id: .paymentMethods,
        title: AppStrings.paymentMethods,
        leadingIcon: LucideIcons.creditCard500,
      ),
      AccountTileConfig(
        id: .notifications,
        title: AppStrings.notifications,
        leadingIcon: LucideIcons.bell500,
      ),
      AccountTileConfig(
        id: .languages,
        title: AppStrings.languages,
        leadingIcon: LucideIcons.globe500,
      ),
    ],
    [
      AccountTileConfig(
        id: .faqs,
        title: AppStrings.faqs,
        leadingIcon: LucideIcons.circleHelp500,
      ),
      AccountTileConfig(
        id: .helpCenter,
        title: AppStrings.helpCenter,
        leadingIcon: LucideIcons.headset500,
      ),
    ],
    [
      AccountTileConfig(
        id: .logout,
        title: AppStrings.logout,
        leadingIcon: LucideIcons.logOut500,
        foregroundColor: Colors.red,
      ),
    ],
  ];

  void _onTilePressed(BuildContext context, AccountTileConfig config) {
    switch (config.id) {
      case AccountTileId.myOrders:
      case AccountTileId.myDetails:
      case AccountTileId.addressBook:
      case AccountTileId.paymentMethods:
      case AccountTileId.notifications:
      case AccountTileId.languages:
      case AccountTileId.faqs:
        debugPrint(config.title);
        break;
      case AccountTileId.helpCenter:
        context.goNamed(AppRoutes.helpCenter.name);
        break;
      case AccountTileId.logout:
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
      appBar: const CustomAppBar(title: AppStrings.account),
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
