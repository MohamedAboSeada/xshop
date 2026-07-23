import 'package:flutter/material.dart';

import 'app_borders.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

// =============================================================================
// 7. Context Extension Helper
// =============================================================================
extension AppThemeExtension on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.fallback();
  AppTypography get typography =>
      Theme.of(this).extension<AppTypography>() ?? AppTypography.fallback();
  AppSpacing get spaces =>
      Theme.of(this).extension<AppSpacing>() ?? AppSpacing.fallback();
  AppRadius get radius =>
      Theme.of(this).extension<AppRadius>() ?? AppRadius.fallback();
  AppBorders get borders =>
      Theme.of(this).extension<AppBorders>() ?? AppBorders.fromColors(colors);
  AppDimensions get dimensions =>
      Theme.of(this).extension<AppDimensions>() ?? AppDimensions.fallback();
}
