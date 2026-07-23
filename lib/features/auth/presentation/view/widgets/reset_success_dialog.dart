import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:xshop/core/constant/app_strings.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../core/widgets/action_button.dart';

class ResetSuccessDialog extends StatelessWidget {
  const ResetSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: .all(context.radius.r20)),
      constraints: const BoxConstraints.tightFor(height: 300.0),
      child: Padding(
        padding: EdgeInsets.all(context.spaces.s24.r),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .stretch,
          children: [
            Column(
              spacing: context.spaces.s12.h,
              children: [
                SvgPicture.asset(AppAssets.checkDuotone),
                Column(
                  spacing: context.spaces.s8.h,
                  children: [
                    Text(
                      AppStrings.passwordChangedTitle,
                      style: context.typography.h4,
                    ),
                    Text(
                      AppStrings.passwordChangedSubtitle,
                      textAlign: .center,
                      style: context.typography.b2Regular.copyWith(
                        color: context.colors.primary500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ActionButton(
              label: AppStrings.signInSubmitBtn,
              onPressed: () {
                context.pop();
                context.goNamed(AppRoutes.signIn.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
