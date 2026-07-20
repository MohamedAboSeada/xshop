import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// primary color (grades)
const $primary0 = ColorToken('primary_0');
const $primary100 = ColorToken('primary_100');
const $primary200 = ColorToken('primary_200');
const $primary300 = ColorToken('primary_300');
const $primary400 = ColorToken('primary_400');
const $primary500 = ColorToken('primary_500');
const $primary600 = ColorToken('primary_600');
const $primary700 = ColorToken('primary_700');
const $primary800 = ColorToken('primary_800');
const $primary900 = ColorToken('primary_900');

/// semantic colors
const $success = ColorToken('success');
const $danger = ColorToken('danger');

/// brand colors
const $githubBrand = ColorToken('github_brand');

/// tokens definition
final colorTokens = {
  $primary0: const Color(0xFFFFFFFF),
  $primary100: const Color(0xFFE6E6E6),
  $primary200: const Color(0xFFCCCCCC),
  $primary300: const Color(0xFFB3B3B3),
  $primary400: const Color(0xFF999999),
  $primary500: const Color(0xFF808080),
  $primary600: const Color(0xFF666666),
  $primary700: const Color(0xFF4D4D4D),
  $primary800: const Color(0xFF333333),
  $primary900: const Color(0xFF1A1A1A),

  $success: const Color(0xFF0C9409),
  $danger: const Color(0xFFED1010),

  $githubBrand: const Color(0xFF24292E),
};
