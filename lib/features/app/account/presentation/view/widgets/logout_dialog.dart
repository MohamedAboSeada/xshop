import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:xshop/core/constant/app_strings.dart';
import '../../../../../../core/constant/app_assets.dart';
import '../../../../../../core/constant/app_routes.dart';
import '../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../core/widgets/action_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

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
                SvgPicture.asset(AppAssets.warning),
                Column(
                  spacing: context.spaces.s8.h,
                  children: [
                    Text(AppStrings.logoutTitle, style: context.typography.h4),
                    Text(
                      AppStrings.logoutSubtitle,
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
                  label: AppStrings.logoutConfirmBtn,
                  type: .danger,
                  onPressed: () {
                    context.goNamed(AppRoutes.signIn.name);
                  },
                ),
                ActionButton(
                  label: AppStrings.logoutCancelBtn,
                  type: .outlined,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
