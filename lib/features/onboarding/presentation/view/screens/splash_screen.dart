import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mix/mix.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/utils/image_cache.dart';
import 'onboarding_screen.dart';

import '../../../../../core/theme/tokens/design_tokens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _doInitThenRedirect();
  }

  Future<void> _precacheAppImages() async {
    final images = [
      ImageConfig(type: .svg, assetPath: AppAssets.onboardingPatternLight),
      ImageConfig(type: .svg, assetPath: AppAssets.onboardingText),
      ImageConfig(type: .normal, assetPath: AppAssets.figure),
    ];

    await Future.wait([
      ...images.map((imgConfig) async {
        if (imgConfig.type == ImageType.svg) {
          await ImageCacheUtils.precacheSvgImage(imgConfig.assetPath);
        } else {
          await ImageCacheUtils.precacheNormalImage(
            context,
            imgConfig.assetPath,
          );
        }
      }),
      Future.delayed(const Duration(seconds: 5)),
    ]);
  }

  Future<void> _doInitThenRedirect() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _precacheAppImages();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// use annotated region to change status bar color
    /// as the scaffold background is dark.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: .light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: $primary900.resolve(context),
        body: StackBox(
          style: StackBoxStyler(fit: .expand),
          children: [
            /// pattern
            SvgPicture.asset(
              AppAssets.onboardingPatternDark,
              alignment: Alignment.topCenter,
            ),

            /// app logo
            Box(
              style: BoxStyler().alignment(.center),
              child: SvgPicture.asset(
                AppAssets.logo,
                width: $logoWidth.resolve(context).w,
                height: $logoHeight.resolve(context).h,
              ),
            ),

            /// center the loading indicator
            Positioned(
              left: $space0.resolve(context),
              right: $space0.resolve(context),
              bottom:
                  MediaQuery.paddingOf(context).bottom +
                  $space64.resolve(context).h,
              child: Box(
                style: BoxStyler().alignment(.center),
                child: CircularProgressIndicator(
                  color: $primary0.resolve(context),
                  strokeCap: .round,
                  constraints: BoxConstraints.tightFor(
                    width: $space56.resolve(context),
                    height: $space56.resolve(context),
                  ),
                  backgroundColor: $primary800.resolve(context),
                  strokeWidth: $space8.resolve(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
