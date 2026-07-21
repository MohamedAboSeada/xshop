import 'package:mix/mix.dart';

import '../tokens/design_tokens.dart';

/// Variants
const muted = NamedVariant('muted');
const moreMuted = NamedVariant('more_muted');

const medium = NamedVariant('medium');
const semibold = NamedVariant('semibold');

/// Heading styles
final largeHeading = TextStyler().style($h1.mix()).color($primary900());
final semiLargeHeading = TextStyler().style($h2.mix()).color($primary900());
final mediumHeading = TextStyler().style($h3.mix()).color($primary900());
final smallHeading = TextStyler().style($h4.mix()).color($primary900());

/// Body styles
final largeBody = TextStyler()
    .style($b1Regular.mix())
    .color($primary900())
    .variants([
      VariantStyle(medium, TextStyler().style($b1Medium.mix())),
      VariantStyle(semibold, TextStyler().style($b1Semibold.mix())),
      VariantStyle(muted, TextStyler().color($primary500())),
      VariantStyle(moreMuted, TextStyler().color($primary400())),
    ]);

final mediumBody = TextStyler()
    .style($b2Regular.mix())
    .color($primary900())
    .variants([
      VariantStyle(medium, TextStyler().style($b2Medium.mix())),
      VariantStyle(semibold, TextStyler().style($b2Semibold.mix())),
      VariantStyle(muted, TextStyler().color($primary500())),
      VariantStyle(moreMuted, TextStyler().color($primary400())),
    ]);

final smallBody = TextStyler()
    .style($b3Regular.mix())
    .color($primary900())
    .variants([
      VariantStyle(medium, TextStyler().style($b3Medium.mix())),
      VariantStyle(semibold, TextStyler().style($b3Semibold.mix())),
      VariantStyle(muted, TextStyler().color($primary500())),
      VariantStyle(moreMuted, TextStyler().color($primary400())),
    ]);

/// Underlined link
final linkTextStyle = TextStyler()
    .style($b1Medium.mix())
    .color($primary900())
    .decoration(.underline)
    .decorationColor($primary900())
    .decorationThickness(1.0);
