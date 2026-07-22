import 'package:flutter/material.dart';
import '../../../../../core/constant/app_assets.dart';
import '../layout/license_layout.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LicenseLayout(
      title: "Privacy Policy",
      markdownPath: AppAssets.policy,
    );
  }
}
