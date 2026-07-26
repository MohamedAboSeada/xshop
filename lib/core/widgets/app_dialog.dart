import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../core/widgets/action_button.dart';

class AppDialog extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String subtitle;
  final String primaryButtonLabel;
  final VoidCallback onPrimaryPressed;
  final ButtonType primaryButtonType;

  final String? secondaryButtonLabel;
  final VoidCallback? onSecondaryPressed;
  final ButtonType secondaryButtonType;

  const AppDialog({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.primaryButtonLabel,
    required this.onPrimaryPressed,
    this.primaryButtonType = .filled,
    this.secondaryButtonLabel,
    this.onSecondaryPressed,
    this.secondaryButtonType = .filled,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: .all(context.radius.r20)),
      child: Padding(
        padding: EdgeInsets.all(context.spaces.s24.r),
        child: Column(
          mainAxisSize: .min,
          spacing: context.spaces.s24.h,
          crossAxisAlignment: .stretch,
          children: [
            Column(
              spacing: context.spaces.s12.h,
              children: [
                SvgPicture.asset(iconAsset),
                Column(
                  spacing: context.spaces.s8.h,
                  children: [
                    Text(title, style: context.typography.h4),
                    Text(
                      subtitle,
                      textAlign: .center,
                      style: context.typography.b1Regular.copyWith(
                        color: context.colors.primary500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              spacing: context.spaces.s12.h,
              mainAxisAlignment: .end,
              crossAxisAlignment: .stretch,
              children: [
                ActionButton(
                  label: primaryButtonLabel,
                  type: primaryButtonType,
                  onPressed: onPrimaryPressed,
                ),

                if (secondaryButtonLabel != null)
                  ActionButton(
                    label: secondaryButtonLabel!,
                    type: secondaryButtonType,
                    onPressed:
                        onSecondaryPressed ?? () => Navigator.of(context).pop(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
