import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:xshop/core/constant/app_routes.dart';
import 'package:xshop/features/auth/presentation/view/widgets/action_prompt.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/form_text_field.dart';
import '../../../../../core/widgets/forms/password_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppForm(
      submitLabel: AppStrings.signInSubmitBtn,
      onSubmit: (formData) {
        debugPrint('Login Data: $formData');
      },
      fields: [
        FormTextField(
          name: AppStrings.fieldEmail,
          label: AppStrings.emailLabel,
          hint: AppStrings.emailHint,
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: AppStrings.emailRequiredErr,
            ),
            FormBuilderValidators.email(errorText: AppStrings.emailInvalidErr),
          ]),
        ),
        const PasswordField(
          name: AppStrings.fieldPassword,
          hint: AppStrings.loginPasswordHint,
          label: AppStrings.loginPasswordLabel,
        ),
      ],
      formFooter: ActionPrompt(
        label: "Forget your password?",
        btnLabel: "Reset",
        onAction: () {
          context.pushNamed(AppRoutes.forgetPassword.name);
        },
        alignment: .centerLeft,
      ),
    );
  }
}
