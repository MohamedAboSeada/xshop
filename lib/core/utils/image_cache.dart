import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { svg, normal }

class ImageConfig {
  final ImageType type;
  final String assetPath;

  ImageConfig({required this.type, required this.assetPath});
}

class ImageCacheUtils {
  const ImageCacheUtils._();

  static Future<void> precacheSvgImage(String imagePath) async {
    final svgLoader = SvgAssetLoader(imagePath);
    await svg.cache.putIfAbsent(
      svgLoader.cacheKey(null),
      () => svgLoader.loadBytes(null),
    );
  }

  static Future<void> precacheNormalImage(
    BuildContext context,
    String imagePath,
  ) async {
    final imageProvider = AssetImage(imagePath);
    await precacheImage(imageProvider, context);
  }
}
