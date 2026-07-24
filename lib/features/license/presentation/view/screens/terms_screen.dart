import 'package:flutter/material.dart';

import '../../../../../core/constant/app_assets.dart';
import '../layout/license_layout.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LicenseLayout(
      title: "Terms",
      markdownPath: AppAssets.terms,
    );
  }
}
