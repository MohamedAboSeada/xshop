enum Location { brand, icons, onboarding }

/// Easy util class to access assets instead of hardcoding it
class AppAssets {
  AppAssets._();
  static const _assetsDir = 'assets/images';
  static const _brandDir = '$_assetsDir/brand';
  static const _iconsDir = '$_assetsDir/icons';
  static const _onboardingDir = '$_assetsDir/onboarding';

  static String _getImageAsset({
    required String assetName,
    required Location location,
  }) {
    return switch (location) {
      Location.brand => "$_brandDir/$assetName",
      Location.icons => "$_iconsDir/$assetName",
      Location.onboarding => "$_onboardingDir/$assetName",
    };
  }

  /// actual assets names
  static final onboardingPatternLight = _getImageAsset(
    assetName: "onboarding_pattern_light.svg",
    location: .onboarding,
  );
  static final onboardingPatternDark = _getImageAsset(
    assetName: "onboarding_pattern.svg",
    location: .onboarding,
  );
  static final onboardingText = _getImageAsset(
    assetName: "onboarding_text.svg",
    location: .onboarding,
  );
  static final figure = _getImageAsset(
    assetName: "figure.png",
    location: .onboarding,
  );
  static final logo = _getImageAsset(assetName: "logo.svg", location: .brand);
}
