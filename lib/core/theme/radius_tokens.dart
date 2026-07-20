import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// radius tokens
const $radius6 = RadiusToken('r6');
const $radius8 = RadiusToken('r8');
const $radius10 = RadiusToken('r10');
const $radius20 = RadiusToken('r20');

/// radius definitions
final radiusTokens = {
  $radius6: const Radius.circular(6),
  $radius8: const Radius.circular(8),
  $radius10: const Radius.circular(10),
  $radius20: const Radius.circular(20),
};