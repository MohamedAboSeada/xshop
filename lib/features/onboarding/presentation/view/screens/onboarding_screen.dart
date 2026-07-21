import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constant/app_assets.dart';
import '../widgets/action_button_app_bar.dart';
import '../../../../../core/theme/tokens/design_tokens.dart';

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
        backgroundColor: $primary0.resolve(context),
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
                top: $space16.resolve(context).h,
                left: $space24.resolve(context).w,
                child: SvgPicture.asset(AppAssets.onboardingText),
              ),

              /// figure image
              Positioned(
                left: $space0.resolve(context),
                right: $space0.resolve(context),
                bottom:
                    -MediaQuery.paddingOf(context).bottom.h -
                    kBottomNavigationBarHeight.h -
                    $space12.resolve(context).h,
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
