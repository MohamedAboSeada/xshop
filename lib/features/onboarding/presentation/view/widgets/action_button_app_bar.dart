import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import 'package:xshop/core/constant/app_strings.dart';
import 'package:xshop/core/theme/styles/text_styles.dart';
import 'package:xshop/core/theme/tokens/design_tokens.dart';

class ActionButtonAppBar extends StatelessWidget {
  const ActionButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final actionButtonStyle = BoxStyler()
        .color($primary900())
        .alignment(.center)
        .borderRadiusAll($radius10())
        .onPressed(BoxStyler().color($primary800()))
        .constraintsOnly();

    return Box(
      style: BoxStyler().borderTop(
        color: $primary100(),
        style: .solid,
        width: 1,
      ),
      child: BottomAppBar(
        padding: .only(
          bottom: $space8.resolve(context),
          left: $space24.resolve(context),
          right: $space24.resolve(context),
          top: $space16.resolve(context),
        ),
        color: $primary0.resolve(context),
        child: PressableBox(
          style: actionButtonStyle,
          child: Row(
            spacing: $space8.resolve(context).w,
            mainAxisAlignment: .center,
            children: [
              StyledText(
                AppStrings.getStarted,
                style: largeBody.applyVariants([medium]).color($primary0()),
              ),
              StyledIcon(
                icon: LucideIcons.arrowRight,
                style: IconStyler().color($primary0()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
