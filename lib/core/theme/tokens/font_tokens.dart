import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Font Weights
const $bold = FontWeightToken('bold');
const $semibold = FontWeightToken('semibold');
const $medium = FontWeightToken('medium');
const $regular = FontWeightToken('regular');

/// Font weights
final fontWeightTokens = {
  $bold: FontWeight.bold,
  $semibold: FontWeight.w600,
  $medium: FontWeight.w500,
  $regular: FontWeight.w400,
};

/// heading tokens
const $h1 = TextStyleToken('h1');
const $h2 = TextStyleToken('h2');
const $h3 = TextStyleToken('h3');
const $h4 = TextStyleToken('h4');
const $h4Medium = TextStyleToken('h4_medium');

/// body
const $b1Regular = TextStyleToken('b1');
const $b1Medium = TextStyleToken('b1_medium');
const $b1Semibold = TextStyleToken('b1_semibold');

const $b2Regular = TextStyleToken('b2');
const $b2Medium = TextStyleToken('b2_medium');
const $b2Semibold = TextStyleToken('b2_semibold');

const $b3Regular = TextStyleToken('b3');
const $b3Medium = TextStyleToken('b3_medium');
const $b3Semibold = TextStyleToken('b3_semibold');

final textStyleTokens = {
  /// heading variants
  $h1: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 64.0,
    height: 0.8,
    fontWeight: fontWeightTokens[$semibold],
  ),
  $h2: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 32.0,
    height: 1,
    fontWeight: fontWeightTokens[$semibold],
  ),
  $h3: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 24.0,
    height: 1.2,
    fontWeight: fontWeightTokens[$semibold],
  ),
  $h4: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 20.0,
    height: 1.2,
    fontWeight: fontWeightTokens[$semibold],
  ),
  $h4Medium: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 20.0,
    height: 1.2,
    fontWeight: fontWeightTokens[$medium],
  ),

  /// body variants
  ///
  /// body regular
  $b1Regular: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 16.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$regular],
  ),
  $b1Medium: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 16.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$medium],
  ),
  $b1Semibold: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 16.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$semibold],
  ),

  /// body medium
  $b2Regular: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 14.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$regular],
  ),
  $b2Medium: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 14.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$medium],
  ),
  $b2Semibold: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 14.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$semibold],
  ),

  /// body small
  $b3Regular: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 12.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$regular],
  ),
  $b3Medium: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 12.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$medium],
  ),
  $b3Semibold: TextStyle(
    fontFamily: "GeneralSans",
    fontSize: 12.0,
    height: 1.4,
    fontWeight: fontWeightTokens[$semibold],
  ),
};
