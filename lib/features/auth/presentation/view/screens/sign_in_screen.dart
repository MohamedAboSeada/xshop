import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/constant/app_strings.dart';
import '../widgets/s_s_o_buttons.dart';
import '../layouts/auth_layout.dart';
import '../widgets/action_prompt.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: AppStrings.signInTitle,
      subtitle: AppStrings.signInSubtitle,
      form: const SignInForm(),
      extra: const SSOButtons(),
      switcher: ActionPrompt(
        label: AppStrings.signInSwitcherLabel,
        btnLabel: AppStrings.signInSwitcherBtnLabel,
        onAction: () {
          context.goNamed(AppRoutes.signUp.name);
        },
      ),
    );
  }
}
