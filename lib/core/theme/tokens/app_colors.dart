import 'package:flutter/material.dart';

// =============================================================================
// 1. Color Tokens
// =============================================================================
class AppColors extends ThemeExtension<AppColors> {
  final Color primary0;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;
  final Color primary800;
  final Color primary900;

  final Color success;
  final Color danger;
  final Color facebookBrand;

  const AppColors({
    required this.primary0,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    required this.success,
    required this.danger,
    required this.facebookBrand,
  });

  factory AppColors.fallback() => const AppColors(
    primary0: Color(0xFFFFFFFF),
    primary100: Color(0xFFE6E6E6),
    primary200: Color(0xFFCCCCCC),
    primary300: Color(0xFFB3B3B3),
    primary400: Color(0xFF999999),
    primary500: Color(0xFF808080),
    primary600: Color(0xFF666666),
    primary700: Color(0xFF4D4D4D),
    primary800: Color(0xFF333333),
    primary900: Color(0xFF1A1A1A),
    success: Color(0xFF0C9409),
    danger: Color(0xFFED1010),
    facebookBrand: Color(0xFF1877f2),
  );

  @override
  AppColors copyWith({
    Color? primary0,
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? primary800,
    Color? primary900,
    Color? success,
    Color? danger,
    Color? facebookBrand,
  }) {
    return AppColors(
      primary0: primary0 ?? this.primary0,
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      primary800: primary800 ?? this.primary800,
      primary900: primary900 ?? this.primary900,
      success: success ?? this.success,
      danger: danger ?? this.danger,
      facebookBrand: facebookBrand ?? this.facebookBrand,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary0: Color.lerp(primary0, other.primary0, t)!,
      primary100: Color.lerp(primary100, other.primary100, t)!,
      primary200: Color.lerp(primary200, other.primary200, t)!,
      primary300: Color.lerp(primary300, other.primary300, t)!,
      primary400: Color.lerp(primary400, other.primary400, t)!,
      primary500: Color.lerp(primary500, other.primary500, t)!,
      primary600: Color.lerp(primary600, other.primary600, t)!,
      primary700: Color.lerp(primary700, other.primary700, t)!,
      primary800: Color.lerp(primary800, other.primary800, t)!,
      primary900: Color.lerp(primary900, other.primary900, t)!,
      success: Color.lerp(success, other.success, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      facebookBrand: Color.lerp(facebookBrand, other.facebookBrand, t)!,
    );
  }
}