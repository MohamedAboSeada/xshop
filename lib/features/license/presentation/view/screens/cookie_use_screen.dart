import 'package:flutter/material.dart';
import '../../../../../core/constant/app_assets.dart';
import '../layout/license_layout.dart';

class CookieUseScreen extends StatelessWidget {
  const CookieUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LicenseLayout(
      title: "Cookie Policy",
      markdownPath: AppAssets.cookie,
    );
  }
}
