import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/app_routes.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/form_text_field.dart';
import '../layouts/password_reset_layout.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PasswordResetLayout(
      title: AppStrings.forgotPasswordTitle,
      subtitle: AppStrings.forgotPasswordSubtitle,
      form: AppForm(
        fields: [
          FormTextField(
            name: AppStrings.fieldEmail,
            label: AppStrings.emailLabel,
            hint: AppStrings.emailHint,
            validators: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: AppStrings.emailRequiredErr,
              ),
              FormBuilderValidators.email(
                errorText: AppStrings.emailInvalidErr,
              ),
            ]),
          ),
        ],
        submitLabel: AppStrings.sendCodeBtn,
        onSubmit: (data) {
          context.pushNamed(
            AppRoutes.verifyEmail.name,
            queryParameters: {
              AppStrings.fieldEmail: data[AppStrings.fieldEmail],
            },
          );
        },
        isActionSeparated: true,
      ),
    );
  }
}
