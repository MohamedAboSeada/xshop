enum Location { brand, icons, onboarding, license }

/// Easy util class to access assets instead of hardcoding it
class AppAssets {
  AppAssets._();
  static const _assetsDir = 'assets';
  static const _brandDir = '$_assetsDir/images/brand';
  static const _iconsDir = '$_assetsDir/images/icons';
  static const _onboardingDir = '$_assetsDir/images/onboarding';
  static const _licenseDir = '$_assetsDir/licenses';

  static String _getAsset({
    required String assetName,
    required Location location,
  }) {
    return switch (location) {
      Location.brand => "$_brandDir/$assetName",
      Location.icons => "$_iconsDir/$assetName",
      Location.onboarding => "$_onboardingDir/$assetName",
      Location.license => "$_licenseDir/$assetName",
    };
  }

  /// actual assets names
  static final onboardingPatternLight = _getAsset(
    assetName: "onboarding_pattern_light.svg",
    location: .onboarding,
  );
  static final onboardingPatternDark = _getAsset(
    assetName: "onboarding_pattern.svg",
    location: .onboarding,
  );
  static final onboardingText = _getAsset(
    assetName: "onboarding_text.svg",
    location: .onboarding,
  );
  static final figure = _getAsset(
    assetName: "figure.png",
    location: .onboarding,
  );
  static final logo = _getAsset(assetName: "logo.svg", location: .brand);

  static final googleIcon = _getAsset(
    assetName: "logos_google.svg",
    location: .icons,
  );
  static final facebookIcon = _getAsset(
    assetName: "logos_facebook.svg",
    location: .icons,
  );
  static final checkDuotone = _getAsset(
    assetName: "Check-duotone.svg",
    location: .icons,
  );

  /// License files
  static final terms = _getAsset(assetName: "terms.md", location: .license);
  static final policy = _getAsset(
    assetName: "privacy_policy.md",
    location: .license,
  );
  static final cookie = _getAsset(
    assetName: "cookie_policy.md",
    location: .license,
  );
}
