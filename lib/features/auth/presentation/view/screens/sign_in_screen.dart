import 'package:flutter/material.dart';
import '../../../../../core/constant/app_strings.dart';
import '../widgets/s_s_o_buttons.dart';
import '../layouts/auth_layout.dart';
import 'sign_up_screen.dart';
import '../widgets/auth_switcher.dart';
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
      switcher: AuthSwitcher(
        label: AppStrings.signInSwitcherLabel,
        btnLabel: AppStrings.signInSwitcherBtnLabel,
        onSwitch: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SignUpScreen()),
          );
        },
      ),
    );
  }
}
