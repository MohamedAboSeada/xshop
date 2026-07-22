import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../widgets/action_button_app_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// use annotated region in order to return status bar
    /// color to dark after changing it in splash screen.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: .dark,
        statusBarBrightness: .light,
      ),
      child: Scaffold(
        backgroundColor: context.colors.primary0,
        body: SafeArea(
          child: Stack(
            fit: .expand,
            children: [
              /// pattern behind figure
              Positioned.fill(
                child: SvgPicture.asset(
                  fit: .cover,
                  AppAssets.onboardingPatternLight,
                ),
              ),

              /// slogan image
              Positioned(
                top: context.spaces.s16.h,
                left: context.spaces.s24.w,
                child: SvgPicture.asset(AppAssets.onboardingText),
              ),

              /// figure image
              Positioned(
                left: context.spaces.s0,
                right: context.spaces.s0,
                bottom:
                    -MediaQuery.paddingOf(context).bottom.h -
                    kBottomNavigationBarHeight.h -
                    context.spaces.s12.h,
                child: Image.asset(fit: .cover, AppAssets.figure),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const ActionButtonAppBar(),
      ),
    );
  }
}
