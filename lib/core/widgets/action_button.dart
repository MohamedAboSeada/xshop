import 'package:flutter/material.dart';
import 'package:xshop/core/constant/app_durations.dart';
import '../theme/tokens/theme_extensions.dart';

enum ButtonType { filled, danger, outlined, ghost }

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    this.alignment = IconAlignment.end,
    this.isLoading = false,
    this.onPressed,
    this.icon,
    this.type = ButtonType.filled,
    this.height,
  });

  final String label;
  final bool isLoading;
  final IconAlignment alignment;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ButtonType type;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isDarkContent =
        type == ButtonType.outlined || type == ButtonType.ghost;
    final Color contentColor = isDarkContent
        ? context.colors.primary900
        : context.colors.primary0;
    final Color indicatorColor = isDarkContent ? Colors.black : Colors.white;

    final bool isDisabled = isLoading || onPressed == null;

    return AnimatedOpacity(
      duration: AppDurations.fast,
      opacity: isDisabled ? 0.6 : 1.0,
      child: TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: _getButtonStyle(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Loading Indicator ---
            if (isLoading) ...[
              SizedBox(
                width: context.spaces.s16,
                height: context.spaces.s16,
                child: CircularProgressIndicator(
                  color: indicatorColor,
                  strokeWidth: 2.5,
                  strokeCap: StrokeCap.round,
                ),
              ),
              SizedBox(width: context.spaces.s12),
            ],

            // --- Start Icon ---
            if (icon != null &&
                alignment == IconAlignment.start &&
                !isLoading) ...[
              Icon(icon, color: contentColor, size: context.spaces.s24),
              SizedBox(width: context.spaces.s12),
            ],

            // --- Label (Text) ---
            Text(
              label,
              style: context.typography.b1Medium.copyWith(color: contentColor),
            ),

            // --- End Icon ---
            if (icon != null &&
                alignment == IconAlignment.end &&
                !isLoading) ...[
              SizedBox(width: context.spaces.s12),
              Icon(icon, color: contentColor, size: context.spaces.s24),
            ],
          ],
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    return ButtonStyle(
      animationDuration: AppDurations.fast,
      elevation: WidgetStateProperty.all(0),

      minimumSize: WidgetStateProperty.all(
        Size(0, height ?? context.spaces.s56),
      ),

      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: context.spaces.s24),
      ),

      overlayColor: WidgetStateProperty.all(Colors.transparent),

      backgroundColor: WidgetStateProperty.resolveWith((states) {
        final isPressed = states.contains(WidgetState.pressed);

        switch (type) {
          case ButtonType.filled:
            return isPressed
                ? context.colors.primary800
                : context.colors.primary900;
          case ButtonType.danger:
            return isPressed
                ? context.colors.danger.withValues(alpha: 0.8)
                : context.colors.danger;
          case ButtonType.outlined:
          case ButtonType.ghost:
            return isPressed ? context.colors.primary100 : Colors.transparent;
        }
      }),

      shape: WidgetStateProperty.resolveWith((states) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(context.radius.r10),
          side: type == ButtonType.outlined
              ? BorderSide(color: context.colors.primary200)
              : BorderSide.none,
        );
      }),
    );
  }
}
