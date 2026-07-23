import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

/// Used to switch between auth screens
class ActionPrompt extends StatelessWidget {
  final String label;
  final String btnLabel;
  final VoidCallback onAction;
  final Alignment alignment;

  const ActionPrompt({
    super.key,
    required this.label,
    required this.btnLabel,
    required this.onAction,
    this.alignment = .center,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        alignment: alignment,
        visualDensity: .compact,
        padding: .zero,
      ),
      onPressed: onAction,
      child: StyledText(
        text: "<label/> <btn />",
        tags: {
          'label': StyledTextWidgetTag(
            Text(
              label,
              style: context.typography.b2Medium.copyWith(
                color: context.colors.primary500,
              ),
            ),
          ),
          'btn': StyledTextWidgetTag(
            Text(
              btnLabel,
              style: context.typography.b2Medium.copyWith(
                decoration: .underline,
                color: context.colors.primary900,
                decorationThickness: 1.0,
                decorationColor: context.colors.primary900,
              ),
            ),
          ),
        },
      ),
    );
  }
}
