import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xshop/core/constant/app_strings.dart';
import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/otp_field.dart';
import '../layouts/password_reset_layout.dart';
import '../widgets/action_prompt.dart';

class VerificationCodeScreen extends StatelessWidget {
  final String email;
  const VerificationCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return PasswordResetLayout(
      title: AppStrings.verificationCodeTitle,
      subtitle: AppStrings.verificationCodeSubtitle(email),
      form: AppForm(
        fields: [
          const OtpField(name: AppStrings.fieldOtp, length: 4),
          ActionPrompt(
            label: AppStrings.emailNotReceivedPrompt,
            btnLabel: AppStrings.resendCodeBtn,
            onAction: () {},
          ),
        ],
        submitLabel: AppStrings.continueBtn,
        onSubmit: (data) {
          context.pushNamed(AppRoutes.resetPassword.name);
        },
        isActionSeparated: true,
      ),
    );
  }
}
