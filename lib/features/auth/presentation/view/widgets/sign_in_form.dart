import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/form_text_field.dart';
import '../../../../../core/widgets/forms/password_field.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

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
        _buildForgetPassword(context),
      ],
    );
  }

  StyledText _buildForgetPassword(BuildContext context) {
    return StyledText(
      text: AppStrings.forgetPasswordText,
      style: context.typography.b2Medium.copyWith(
        color: context.colors.primary500,
      ),
      tags: {
        AppStrings.tagLink: StyledTextActionTag(
          (String? text, Map<String?, String?> attrs) {
            final String tag = attrs['tag']!;
            debugPrint(tag);
          },
          style: context.typography.b2Semibold.copyWith(
            decoration: TextDecoration.underline,
            color: context.colors.primary900,
          ),
        ),
      },
    );
  }
}
