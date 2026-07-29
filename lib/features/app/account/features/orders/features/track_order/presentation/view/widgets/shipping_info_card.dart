import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import '../../../../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../../../../core/widgets/action_button.dart';
import '../../../domain/entities/shipping_info.dart';

import '../../../../../../../../../../core/theme/tokens/theme_extensions.dart';

class ShippingInfoCard extends StatelessWidget {
  final ShippingInfo info;
  final ValueChanged<String> onCopyTap;
  final VoidCallback onViewWebsiteTap;

  const ShippingInfoCard({
    super.key,
    required this.info,
    required this.onCopyTap,
    required this.onViewWebsiteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.spaces.s16),
      decoration: BoxDecoration(
        color: context.colors.primary0,
        borderRadius: BorderRadius.all(context.radius.r10),
        border: context.borders.moreMutedBorder,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.shippingInfo, style: context.typography.b1Semibold),
          context.spaces.s12.verticalSpace,

          _buildSpecialText(
            context,
            AppStrings.shippingCompany(info.shippingCompany),
          ),
          context.spaces.s8.verticalSpace,

          _buildSpecialText(
            context,
            AppStrings.orderTrackingNumber(info.trackingNumber),
          ),
          context.spaces.s16.verticalSpace,
          ActionButton(
            onPressed: () {
              onCopyTap(info.trackingNumber);
            },
            label: AppStrings.copyTrackingNumber,
            icon: LucideIcons.copy,
            alignment: .start,
          ),
        ],
      ),
    );
  }

  StyledText _buildSpecialText(BuildContext context, String text) {
    return StyledText(
      text: text,
      style: context.typography.b2Regular.copyWith(
        color: context.colors.primary500,
      ),
      tags: {
        "bold": StyledTextTag(
          style: context.typography.b2Semibold.copyWith(
            color: context.colors.primary900,
          ),
        ),
      },
    );
  }
}
