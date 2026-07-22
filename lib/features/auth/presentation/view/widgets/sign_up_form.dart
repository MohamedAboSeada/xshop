import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../license/presentation/view/screens/cookie_use_screen.dart';
import '../../../../license/presentation/view/screens/policy_screen.dart';
import '../../../../license/presentation/view/screens/terms_screen.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/form_text_field.dart';
import '../../../../../core/widgets/forms/password_field.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

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
        _buildTermsAndConditions(context),
      ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsScreen()),
              );
            } else if (tag == AppStrings.tagPolicy) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PolicyScreen()),
              );
            } else if (tag == AppStrings.tagCookie) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CookieUseScreen(),
                ),
              );
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
