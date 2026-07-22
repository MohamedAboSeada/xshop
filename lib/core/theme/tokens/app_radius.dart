import 'package:flutter/material.dart';

// =============================================================================
// 4. Radius Tokens[cite: 4]
// =============================================================================

class AppRadius extends ThemeExtension<AppRadius> {
  final Radius r6;
  final Radius r8;
  final Radius r10;
  final Radius r20;

  const AppRadius({
    required this.r6,
    required this.r8,
    required this.r10,
    required this.r20,
  });

  factory AppRadius.fallback() => const AppRadius(
    r6: Radius.circular(6),
    r8: Radius.circular(8),
    r10: Radius.circular(10),
    r20: Radius.circular(20),
  );

  @override
  AppRadius copyWith({Radius? r6, Radius? r8, Radius? r10, Radius? r20}) {
    return AppRadius(
      r6: r6 ?? this.r6,
      r8: r8 ?? this.r8,
      r10: r10 ?? this.r10,
      r20: r20 ?? this.r20,
    );
  }

  @override
  AppRadius lerp(ThemeExtension<AppRadius>? other, double t) {
    if (other is! AppRadius) return this;
    return AppRadius(
      r6: Radius.lerp(r6, other.r6, t)!,
      r8: Radius.lerp(r8, other.r8, t)!,
      r10: Radius.lerp(r10, other.r10, t)!,
      r20: Radius.lerp(r20, other.r20, t)!,
    );
  }
}
