import 'package:flutter/material.dart';
import 'dart:ui';

// =============================================================================
// 3. Spacing Tokens[cite: 5]
// =============================================================================

class AppSpacing extends ThemeExtension<AppSpacing> {
  final double s0,
      s4,
      s8,
      s12,
      s16,
      s24,
      s32,
      s40,
      s48,
      s56,
      s64,
      s72,
      s80,
      s96,
      s128;

  const AppSpacing({
    required this.s0,
    required this.s4,
    required this.s8,
    required this.s12,
    required this.s16,
    required this.s24,
    required this.s32,
    required this.s40,
    required this.s48,
    required this.s56,
    required this.s64,
    required this.s72,
    required this.s80,
    required this.s96,
    required this.s128,
  });

  factory AppSpacing.fallback() => const AppSpacing(
    s0: 0.0,
    s4: 4.0,
    s8: 8.0,
    s12: 12.0,
    s16: 16.0,
    s24: 24.0,
    s32: 32.0,
    s40: 40.0,
    s48: 48.0,
    s56: 56.0,
    s64: 64.0,
    s72: 72.0,
    s80: 80.0,
    s96: 96.0,
    s128: 128.0,
  );

  @override
  AppSpacing copyWith({
    double? s0,
    double? s4,
    double? s8,
    double? s12,
    double? s16,
    double? s24,
    double? s32,
    double? s40,
    double? s48,
    double? s56,
    double? s64,
    double? s72,
    double? s80,
    double? s96,
    double? s128,
  }) {
    return AppSpacing(
      s0: s0 ?? this.s0,
      s4: s4 ?? this.s4,
      s8: s8 ?? this.s8,
      s12: s12 ?? this.s12,
      s16: s16 ?? this.s16,
      s24: s24 ?? this.s24,
      s32: s32 ?? this.s32,
      s40: s40 ?? this.s40,
      s48: s48 ?? this.s48,
      s56: s56 ?? this.s56,
      s64: s64 ?? this.s64,
      s72: s72 ?? this.s72,
      s80: s80 ?? this.s80,
      s96: s96 ?? this.s96,
      s128: s128 ?? this.s128,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      s0: lerpDouble(s0, other.s0, t)!,
      s4: lerpDouble(s4, other.s4, t)!,
      s8: lerpDouble(s8, other.s8, t)!,
      s12: lerpDouble(s12, other.s12, t)!,
      s16: lerpDouble(s16, other.s16, t)!,
      s24: lerpDouble(s24, other.s24, t)!,
      s32: lerpDouble(s32, other.s32, t)!,
      s40: lerpDouble(s40, other.s40, t)!,
      s48: lerpDouble(s48, other.s48, t)!,
      s56: lerpDouble(s56, other.s56, t)!,
      s64: lerpDouble(s64, other.s64, t)!,
      s72: lerpDouble(s72, other.s72, t)!,
      s80: lerpDouble(s80, other.s80, t)!,
      s96: lerpDouble(s96, other.s96, t)!,
      s128: lerpDouble(s128, other.s128, t)!,
    );
  }
}
