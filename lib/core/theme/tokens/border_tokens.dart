import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'design_tokens.dart';

/// general border
const $mutedBorder = BorderSideToken('input_b_muted');

/// input borders
const $focusedBorder = BorderSideToken('input_b_focused');
const $errorBorder = BorderSideToken('input_b_error');
const $successBorder = BorderSideToken('input_b_success');

final borderTokens = {
  $mutedBorder: BorderSide(color: colorTokens[$primary100]!),

  $focusedBorder: BorderSide(color: colorTokens[$primary900]!),
  $errorBorder: BorderSide(color: colorTokens[$danger]!),
  $successBorder: BorderSide(color: colorTokens[$success]!),
};
