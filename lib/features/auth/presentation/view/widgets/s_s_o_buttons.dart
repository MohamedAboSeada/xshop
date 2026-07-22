import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import 's_s_o_button.dart';

class SSOButtons extends StatelessWidget {
  const SSOButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spaces.s16.h,
      children: [
        SSOButton(
          onPressed: () {},
          label: AppStrings.continueWithGoogle,
          icon: AppAssets.googleIcon,
        ),
        SSOButton(
          isOutlined: false,
          backgroundColor: context.colors.facebookBrand,
          foregroundColor: context.colors.primary0,
          onPressed: () {},
          label: AppStrings.continueWithFacebook,
          icon: AppAssets.facebookIcon,
        ),
      ],
    );
  }
}
