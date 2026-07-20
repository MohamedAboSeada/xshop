import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:xshop/core/theme/design_tokens.dart';

/// general border
final $mutedBorder = BorderSideToken('input_b_muted');

/// input borders
final $focusedBorder = BorderSideToken('input_b_focused');
final $errorBorder = BorderSideToken('input_b_error');
final $successBorder = BorderSideToken('input_b_success');

final borderTokens = {
  $mutedBorder: BorderSide(color: colorTokens[$primary100]!, width: 1.0),

  $focusedBorder: BorderSide(color: colorTokens[$primary900]!, width: 1.0),
  $errorBorder: BorderSide(color: colorTokens[$danger]!, width: 1.0),
  $successBorder: BorderSide(color: colorTokens[$success]!, width: 1.0),
};
