import 'package:flutter/material.dart';

import 'tokens/app_tokens.dart';

class AppTheme {
  AppTheme._();
  static final _typography = AppTypography.fallback();
  static final _spacing = AppSpacing.fallback();
  static final _radius = AppRadius.fallback();
  static final _dimensions = AppDimensions.fallback();
  static final _colors = AppColors.fallback();
  static final _borders = AppBorders.fromColors(_colors);

  static final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _colors.primary900,
    onPrimary: _colors.primary0,
    secondary: _colors.primary700,
    onSecondary: _colors.primary0,
    error: _colors.danger,
    onError: _colors.primary0,
    surface: _colors.primary0,
    onSurface: _colors.primary900,
  );

  static ThemeData get appTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: .light,

      scaffoldBackgroundColor: _colors.primary0,
      primaryColor: _colors.primary900,

      fontFamily: "GeneralSans",
      colorScheme: colorScheme,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: _colors.primary900,
        selectionColor: _colors.primary100,
        selectionHandleColor: _colors.primary900,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,

        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: Colors.black, size: 26);
          }

          return const IconThemeData(color: Colors.grey, size: 24);
        }),

        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return _typography.b3Medium.copyWith(color: _colors.primary900);
          }

          return _typography.b3Medium.copyWith(color: _colors.primary400);
        }),
      ),

      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(borderRadius: .all(_radius.r10)),
        enabledBorder: _borders.mutedBorder.toOutlineInputBorder(
          borderRadius: .all(_radius.r10),
        ),
        focusedBorder: _borders.focusedBorder
            .withWidth(2.0)
            .toOutlineInputBorder(borderRadius: .all(_radius.r10)),
        errorBorder: _borders.errorBorder.toOutlineInputBorder(
          borderRadius: .all(_radius.r10),
        ),
        focusedErrorBorder: _borders.errorBorder
            .withWidth(2.0)
            .toOutlineInputBorder(borderRadius: .all(_radius.r10)),
        hintStyle: _typography.b1Medium.copyWith(color: _colors.primary400),
        errorStyle: _typography.b2Medium.copyWith(color: _colors.danger),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        isDense: true,
      ),

      dividerTheme: DividerThemeData(color: _colors.primary100, thickness: 1),
      extensions: [
        _typography,
        _spacing,
        _radius,
        _dimensions,
        _colors,
        _borders,
      ],
    );
  }
}
