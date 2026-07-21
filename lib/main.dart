import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mix/mix.dart';
import 'package:xshop/core/constant/app_assets.dart';
import 'package:xshop/core/utils/image_cache.dart';

import 'app.dart';
import 'core/theme/tokens/design_tokens.dart';

/// precache splash screen images to avoid images flickering
/// TODO will be transfered later
Future<void> _precacheSplashImages() async {
  try {
    final splashImages = [
      ImageConfig(type: .svg, assetPath: AppAssets.logo),
      ImageConfig(type: .svg, assetPath: AppAssets.onboardingPatternDark),
    ];

    await Future.wait(
      splashImages.map(
        (imgConfig) => ImageCacheUtils.precacheSvgImage(imgConfig.assetPath),
      ),
    );
  } catch (e) {
    debugPrint(
      "Error while pre-caching splash screen images."
      "\n$e",
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: .dark,
      statusBarBrightness: .light,
    ),
  );

  await _precacheSplashImages();

  runApp(
    MixScope(
      colors: colorTokens,
      spaces: spaceTokens,
      radii: radiusTokens,
      borders: borderTokens,
      textStyles: textStyleTokens,
      fontWeights: fontWeightTokens,
      doubles: doubleTokens,
      child: const MainApp(),
    ),
  );
}
