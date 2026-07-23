import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/constant/app_strings.dart';
import '../widgets/s_s_o_buttons.dart';
import '../layouts/auth_layout.dart';
import '../widgets/auth_switcher.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: AppStrings.signUpTitle,
      subtitle: AppStrings.signUpSubtitle,
      form: const SignUpForm(),
      extra: const SSOButtons(),
      switcher: AuthSwitcher(
        label: AppStrings.signUpSwitcherLabel,
        btnLabel: AppStrings.signUpSwitcherBtnLabel,
        onSwitch: () {
          context.goNamed(AppRoutes.signIn.name);
        },
      ),
    );
  }
}
