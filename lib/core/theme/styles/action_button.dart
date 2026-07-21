import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mix/mix.dart';
import 'text_styles.dart';
import '../tokens/design_tokens.dart';

enum ButtonType {
  filled(variant: NamedVariant("filled")),
  danger(variant: NamedVariant("danger")),
  outlined(variant: NamedVariant("outlined")),
  ghost(variant: NamedVariant("ghost"));

  final NamedVariant variant;

  const ButtonType({required this.variant});
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    this.alignment = IconAlignment.end,
    this.isLoading = false,
    this.onPressed,
    this.icon,
    this.type,
    this.height,
  });

  final String label;
  final bool isLoading;
  final IconAlignment alignment;
  final IconData? icon;
  final VoidCallback? onPressed;
  final ButtonType? type;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isDarkContent =
        type == ButtonType.outlined || type == ButtonType.ghost;
    final contentColor = isDarkContent ? $primary900() : $primary0();
    final indicatorColor = isDarkContent ? Colors.black : Colors.white;
    final buttonStyle = BoxStyler()
        .borderRadiusAll($radius10())
        .height(height?.h ?? $space56())
        .alignment(.center)
        .color($primary900())
        .onPressed(
          BoxStyler()
              .color($primary800())
              .animate(.easeIn(const Duration(milliseconds: 200))),
        )
        .onDisabled(
          BoxStyler()
              .wrap(.opacity(0.6))
              .animate(.easeOut(const Duration(milliseconds: 200))),
        )
        .animate(.easeIn(const Duration(milliseconds: 200)))
        .variants([
          VariantStyle(
            ButtonType.danger.variant,
            BoxStyler()
                .color($danger())
                .onPressed(BoxStyler().color($danger()).wrap(.opacity(0.8)))
                .animate(.easeIn(const Duration(milliseconds: 200))),
          ),
          VariantStyle(
            ButtonType.outlined.variant,
            BoxStyler()
                .color(Colors.transparent)
                .borderAll(color: $primary200())
                .onPressed(BoxStyler().color($primary100()))
                .animate(.easeIn(const Duration(milliseconds: 200))),
          ),
          VariantStyle(
            ButtonType.ghost.variant,
            BoxStyler()
                .color(Colors.transparent)
                .onPressed(BoxStyler().color($primary100()))
                .animate(.easeIn(const Duration(milliseconds: 200))),
          ),
        ]);

    final buttonIcon = StyledIcon(
      icon: icon,
      style: IconStyler().color(contentColor).size($space24()),
    );

    return PressableBox(
      style: buttonStyle.applyVariants([if (type != null) type!.variant]),
      onPress: isLoading ? null : onPressed,
      enabled: !isLoading && onPressed != null,
      child: RowBox(
        style: FlexBoxStyler().mainAxisSize(.min).spacing($space12()),
        children: [
          if (isLoading)
            CircularProgressIndicator(
              color: indicatorColor,
              constraints: BoxConstraints.tightFor(
                width: $space16.resolve(context).w,
                height: $space16.resolve(context).h,
              ),
              strokeWidth: 2.5,
              strokeCap: StrokeCap.round,
            ),
          if (icon != null && alignment == IconAlignment.start && !isLoading)
            buttonIcon,
          StyledText(
            label,
            style: largeBody.color(contentColor).applyVariants([medium]),
          ),
          if (icon != null && alignment == IconAlignment.end && !isLoading)
            buttonIcon,
        ],
      ),
    );
  }
}
