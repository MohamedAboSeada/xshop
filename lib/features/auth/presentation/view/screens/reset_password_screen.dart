import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/widgets/forms/app_form.dart';
import '../../../../../core/widgets/forms/password_field.dart';
import '../layouts/password_reset_layout.dart';
import '../widgets/reset_success_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ResetSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PasswordResetLayout(
      title: AppStrings.resetPasswordTitle,
      subtitle: AppStrings.resetPasswordSubtitle,
      form: AppForm(
        formKey: _formKey,
        fields: [
          const PasswordField(
            name: AppStrings.fieldPassword,
            hint: AppStrings.createPasswordHint,
            label: AppStrings.createPasswordLabel,
            type: .signUp,
          ),
          PasswordField(
            name: AppStrings.fieldConfirmPassword,
            hint: AppStrings.confirmPasswordHint,
            label: AppStrings.confirmPasswordLabel,
            type: .confirm,
            matchValue: () {
              return _formKey
                  .currentState
                  ?.fields[AppStrings.fieldPassword]
                  ?.value
                  ?.toString();
            },
          ),
        ],
        submitLabel: AppStrings.continueBtn,
        onSubmit: (data) {
          _openDialog(context);
        },
        isActionSeparated: true,
      ),
    );
  }
}
