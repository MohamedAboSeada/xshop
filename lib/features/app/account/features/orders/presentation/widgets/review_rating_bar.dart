import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../core/theme/tokens/theme_extensions.dart';

class ReviewRatingBar extends StatelessWidget {
  final String name;
  const ReviewRatingBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormBuilderField<double>(
        name: name,
        builder: (field) => RatingBar.builder(
          updateOnDrag: true,
          glowColor: context.colors.warning.withValues(alpha: 0.4),
          allowHalfRating: true,
          itemBuilder: (context, index) {
            return Icon(Icons.star_rounded, color: context.colors.warning);
          },
          onRatingUpdate: field.didChange,
        ),
      ),
    );
  }
}
