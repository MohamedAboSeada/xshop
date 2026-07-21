import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:mix/mix.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/theme/styles/action_button.dart';
import '../../../../../core/theme/tokens/design_tokens.dart';

class ActionButtonAppBar extends StatelessWidget {
  const ActionButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: ActionButton(
          label: AppStrings.getStarted,
          onPressed: () {},
          icon: LucideIcons.arrowRight,
          type: .filled,
        ),
      ),
    );
  }
}
