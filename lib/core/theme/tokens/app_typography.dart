import 'package:flutter/material.dart';

// =============================================================================
// 2. Typography Tokens
// =============================================================================
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h4Medium;
  final TextStyle b1Regular;
  final TextStyle b1Medium;
  final TextStyle b1Semibold;
  final TextStyle b2Regular;
  final TextStyle b2Medium;
  final TextStyle b2Semibold;
  final TextStyle b3Regular;
  final TextStyle b3Medium;
  final TextStyle b3Semibold;

  const AppTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h4Medium,
    required this.b1Regular,
    required this.b1Medium,
    required this.b1Semibold,
    required this.b2Regular,
    required this.b2Medium,
    required this.b2Semibold,
    required this.b3Regular,
    required this.b3Medium,
    required this.b3Semibold,
  });

  factory AppTypography.fallback() {
    const String fontFamily = "GeneralSans";
    const FontWeight semibold = FontWeight.w600;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return const AppTypography(
      h1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 64.0,
        height: 0.8,
        fontWeight: semibold,
      ),
      h2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32.0,
        height: 1.0,
        fontWeight: semibold,
      ),
      h3: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24.0,
        height: 1.2,
        fontWeight: semibold,
      ),
      h4: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.0,
        height: 1.2,
        fontWeight: semibold,
      ),
      h4Medium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20.0,
        height: 1.2,
        fontWeight: medium,
      ),
      b1Regular: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.0,
        height: 1.4,
        fontWeight: regular,
      ),
      b1Medium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.0,
        height: 1.4,
        fontWeight: medium,
      ),
      b1Semibold: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16.0,
        height: 1.4,
        fontWeight: semibold,
      ),
      b2Regular: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.0,
        height: 1.4,
        fontWeight: regular,
      ),
      b2Medium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.0,
        height: 1.4,
        fontWeight: medium,
      ),
      b2Semibold: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14.0,
        height: 1.4,
        fontWeight: semibold,
      ),
      b3Regular: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.0,
        height: 1.4,
        fontWeight: regular,
      ),
      b3Medium: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.0,
        height: 1.4,
        fontWeight: medium,
      ),
      b3Semibold: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.0,
        height: 1.4,
        fontWeight: semibold,
      ),
    );
  }

  @override
  AppTypography copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h4Medium,
    TextStyle? b1Regular,
    TextStyle? b1Medium,
    TextStyle? b1Semibold,
    TextStyle? b2Regular,
    TextStyle? b2Medium,
    TextStyle? b2Semibold,
    TextStyle? b3Regular,
    TextStyle? b3Medium,
    TextStyle? b3Semibold,
  }) {
    return AppTypography(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h4Medium: h4Medium ?? this.h4Medium,
      b1Regular: b1Regular ?? this.b1Regular,
      b1Medium: b1Medium ?? this.b1Medium,
      b1Semibold: b1Semibold ?? this.b1Semibold,
      b2Regular: b2Regular ?? this.b2Regular,
      b2Medium: b2Medium ?? this.b2Medium,
      b2Semibold: b2Semibold ?? this.b2Semibold,
      b3Regular: b3Regular ?? this.b3Regular,
      b3Medium: b3Medium ?? this.b3Medium,
      b3Semibold: b3Semibold ?? this.b3Semibold,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      h4Medium: TextStyle.lerp(h4Medium, other.h4Medium, t)!,
      b1Regular: TextStyle.lerp(b1Regular, other.b1Regular, t)!,
      b1Medium: TextStyle.lerp(b1Medium, other.b1Medium, t)!,
      b1Semibold: TextStyle.lerp(b1Semibold, other.b1Semibold, t)!,
      b2Regular: TextStyle.lerp(b2Regular, other.b2Regular, t)!,
      b2Medium: TextStyle.lerp(b2Medium, other.b2Medium, t)!,
      b2Semibold: TextStyle.lerp(b2Semibold, other.b2Semibold, t)!,
      b3Regular: TextStyle.lerp(b3Regular, other.b3Regular, t)!,
      b3Medium: TextStyle.lerp(b3Medium, other.b3Medium, t)!,
      b3Semibold: TextStyle.lerp(b3Semibold, other.b3Semibold, t)!,
    );
  }
}