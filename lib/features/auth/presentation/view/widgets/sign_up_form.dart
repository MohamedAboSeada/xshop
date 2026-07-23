import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';

import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/form_text_field.dart';
import '../../../../../core/widgets/forms/password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppForm(
      submitLabel: AppStrings.signUpSubmitBtn,
      onSubmit: (formData) {
        debugPrint('Sign Up Data: $formData');
      },
      fields: [
        FormTextField(
          name: AppStrings.fieldFullName,
          label: AppStrings.fullNameLabel,
          hint: AppStrings.fullNameHint,
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: AppStrings.fullNameRequiredErr,
            ),
            FormBuilderValidators.minLength(
              4,
              errorText: AppStrings.fullNameLengthErr,
            ),
          ]),
        ),
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
          hint: AppStrings.createPasswordHint,
          label: AppStrings.createPasswordLabel,
          type: .signUp,
        ),
      ],
      formFooter: _buildTermsAndConditions(context),
    );
  }

  StyledText _buildTermsAndConditions(BuildContext context) {
    return StyledText(
      text: AppStrings.termsAndConditionsText,
      style: context.typography.b2Medium.copyWith(
        color: context.colors.primary500,
      ),
      tags: {
        AppStrings.tagLink: StyledTextActionTag(
          (String? text, Map<String?, String?> attrs) {
            final String tag = attrs['tag']!;
            if (tag == AppStrings.tagTerms) {
              context.goNamed(AppRoutes.terms.name);
            } else if (tag == AppStrings.tagPolicy) {
              context.goNamed(AppRoutes.policy.name);
            } else if (tag == AppStrings.tagCookie) {
              context.goNamed(AppRoutes.cookies.name);
            }
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
