import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../core/widgets/custom_app_bar.dart';
import '../../data/models/help_center_item.dart';
import '../widgets/help_center_tile.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  static const _helpCenterItems = [
    HelpCenterItem(
      icon: LucideIcons.headset500,
      title: AppStrings.customerService,
      id: HelpCenterItemId.customerService,
    ),
    HelpCenterItem(
      icon: LucideIcons.messageCircle500,
      title: AppStrings.whatsapp,
      id: HelpCenterItemId.whatsapp,
    ),
    HelpCenterItem(
      icon: LucideIcons.panelTop500,
      title: AppStrings.website,
      id: HelpCenterItemId.website,
    ),
    HelpCenterItem(
      icon: LucideIcons.circleFadingPlus500,
      title: AppStrings.facebook,
      id: HelpCenterItemId.facebook,
    ),
    HelpCenterItem(
      icon: LucideIcons.circleFadingPlus500,
      title: AppStrings.twitter,
      id: HelpCenterItemId.twitter,
    ),
    HelpCenterItem(
      icon: LucideIcons.circleFadingPlus500,
      title: AppStrings.instagram,
      id: HelpCenterItemId.instagram,
    ),
  ];

  void _handleTileTap(HelpCenterItem item) {
    switch (item.id) {
      case HelpCenterItemId.customerService:
      case HelpCenterItemId.whatsapp:
      case HelpCenterItemId.website:
      case HelpCenterItemId.facebook:
      case HelpCenterItemId.twitter:
      case HelpCenterItemId.instagram:
        debugPrint(item.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.helpCenter),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spaces.s24.w),
        child: Column(
          spacing: context.spaces.s12.h,
          children: _helpCenterItems
              .map(
                (item) => HelpCenterTile(
                  item: item,
                  onTap: () => _handleTileTap(item),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
