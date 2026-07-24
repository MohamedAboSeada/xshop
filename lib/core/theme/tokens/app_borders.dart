// =============================================================================
// 5. Border Tokens
// =============================================================================
import 'package:flutter/material.dart';
import 'package:xshop/core/theme/tokens/app_colors.dart';

class AppBorders extends ThemeExtension<AppBorders> {
  final BoxBorder mutedBorder;
  final BoxBorder focusedBorder;
  final BoxBorder errorBorder;
  final BoxBorder successBorder;
  final BoxBorder moreMutedBorder;

  const AppBorders({
    required this.mutedBorder,
    required this.focusedBorder,
    required this.errorBorder,
    required this.successBorder,
    required this.moreMutedBorder,
  });

  factory AppBorders.fromColors(AppColors colors) => AppBorders(
    mutedBorder: Border.all(color: colors.primary400),
    focusedBorder: Border.all(color: colors.primary900),
    moreMutedBorder: Border.all(color: colors.primary100),
    errorBorder: Border.all(color: colors.danger),
    successBorder: Border.all(color: colors.success),
  );

  @override
  AppBorders copyWith({
    BoxBorder? mutedBorder,
    BoxBorder? focusedBorder,
    BoxBorder? errorBorder,
    BoxBorder? successBorder,
    BoxBorder? moreMutedBorder,
  }) {
    return AppBorders(
      mutedBorder: mutedBorder ?? this.mutedBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      successBorder: successBorder ?? this.successBorder,
      moreMutedBorder: moreMutedBorder ?? this.moreMutedBorder,
    );
  }

  @override
  AppBorders lerp(ThemeExtension<AppBorders>? other, double t) {
    if (other is! AppBorders) return this;
    return AppBorders(
      mutedBorder: BoxBorder.lerp(mutedBorder, other.mutedBorder, t)!,
      focusedBorder: BoxBorder.lerp(focusedBorder, other.focusedBorder, t)!,
      errorBorder: BoxBorder.lerp(errorBorder, other.errorBorder, t)!,
      successBorder: BoxBorder.lerp(successBorder, other.successBorder, t)!,
      moreMutedBorder: BoxBorder.lerp(
        moreMutedBorder,
        other.moreMutedBorder,
        t,
      )!,
    );
  }
}

extension BoxBorderExt on BoxBorder {
  BoxBorder withWidth(double width) {
    if (this is Border) {
      final border = this as Border;
      return Border.fromBorderSide(border.top.copyWith(width: width));
    }
    return this;
  }

  BorderSide toBorderSide({double? width}) {
    if (this is Border) {
      final side = (this as Border).top;
      return width != null ? side.copyWith(width: width) : side;
    }
    return BorderSide.none;
  }

  OutlineInputBorder toOutlineInputBorder({
    required BorderRadius borderRadius,
    double? width,
  }) {
    if (this is Border) {
      final border = this as Border;
      final side = border.top;
      return OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: width != null ? side.copyWith(width: width) : side,
      );
    }
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
    );
  }
}
