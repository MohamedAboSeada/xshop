import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xshop/core/constant/app_durations.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/utils/image_cache.dart';
import 'onboarding_screen.dart';

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
      ImageConfig(type: .svg, assetPath: AppAssets.facebookIcon),
      ImageConfig(type: .svg, assetPath: AppAssets.googleIcon),
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
      Future.delayed(AppDurations.longDelay),
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
        backgroundColor: context.colors.primary900,
        body: Stack(
          fit: .expand,
          children: [
            /// pattern
            SvgPicture.asset(
              AppAssets.onboardingPatternDark,
              alignment: Alignment.topCenter,
            ),

            /// app logo
            Center(
              child: SvgPicture.asset(
                AppAssets.logo,
                width: context.dimensions.logoWidth.w,
                height: context.dimensions.logoHeight.h,
              ),
            ),

            /// center the loading indicator
            Positioned(
              left: context.spaces.s0,
              right: context.spaces.s0,
              bottom:
                  MediaQuery.paddingOf(context).bottom + context.spaces.s64.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: context.colors.primary0,
                  strokeCap: .round,
                  constraints: BoxConstraints.tightFor(
                    width: context.spaces.s56,
                    height: context.spaces.s56,
                  ),
                  backgroundColor: context.colors.primary800,
                  strokeWidth: context.spaces.s8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
