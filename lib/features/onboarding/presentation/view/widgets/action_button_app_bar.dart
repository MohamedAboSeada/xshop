import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../../../auth/presentation/view/screens/sign_up_screen.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/widgets/action_button.dart';

class ActionButtonAppBar extends StatelessWidget {
  const ActionButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: context.colors.primary100),
      ),
      child: BottomAppBar(
        padding: .only(
          bottom: context.spaces.s8,
          left: context.spaces.s24,
          right: context.spaces.s24,
          top: context.spaces.s16,
        ),
        color: context.colors.primary0,
        child: ActionButton(
          label: AppStrings.getStarted,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          icon: LucideIcons.arrowRight,
        ),
      ),
    );
  }
}
