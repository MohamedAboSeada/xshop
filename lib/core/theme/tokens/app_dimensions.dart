import 'package:flutter/material.dart';
import 'dart:ui';

// =============================================================================
// 6. Dimensions Tokens
// =============================================================================

class AppDimensions extends ThemeExtension<AppDimensions> {
  final double logoWidth;
  final double logoHeight;

  const AppDimensions({required this.logoWidth, required this.logoHeight});

  factory AppDimensions.fallback() =>
      const AppDimensions(logoWidth: 133.0, logoHeight: 133.0);

  @override
  AppDimensions copyWith({double? logoWidth, double? logoHeight}) {
    return AppDimensions(
      logoWidth: logoWidth ?? this.logoWidth,
      logoHeight: logoHeight ?? this.logoHeight,
    );
  }

  @override
  AppDimensions lerp(ThemeExtension<AppDimensions>? other, double t) {
    if (other is! AppDimensions) return this;
    return AppDimensions(
      logoWidth: lerpDouble(logoWidth, other.logoWidth, t)!,
      logoHeight: lerpDouble(logoHeight, other.logoHeight, t)!,
    );
  }
}
