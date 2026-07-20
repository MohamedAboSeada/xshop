import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'app.dart';
import 'core/theme/tokens/design_tokens.dart';

void main() {
  runApp(
    MixScope(
      colors: colorTokens,
      spaces: spaceTokens,
      radii: radiusTokens,
      borders: borderTokens,
      textStyles: textStyleTokens,
      fontWeights: fontWeightTokens,
      child: const MainApp(),
    ),
  );
}
