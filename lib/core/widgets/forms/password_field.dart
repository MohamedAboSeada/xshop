import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../constant/app_strings.dart';
import '../../theme/tokens/theme_extensions.dart';

import 'form_text_field.dart';

enum PasswordFieldType { login, signUp }

class PasswordField extends StatefulWidget {
  final String name;
  final String hint;
  final String label;
  final PasswordFieldType type;

  const PasswordField({
    super.key,
    required this.name,
    required this.hint,
    required this.label,
    this.type = PasswordFieldType.login,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _obscured = true;

  void _toggleObscurity() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fieldValidators = widget.type == PasswordFieldType.signUp
        ? FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: AppStrings.passwordRequired,
            ),
            FormBuilderValidators.password(
              errorText: AppStrings.strongPassword,
            ),
          ])
        : FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: AppStrings.passwordRequired,
            ),
            FormBuilderValidators.minLength(
              8,
              errorText: AppStrings.passwordLength,
            ),
          ]);

    return FormTextField(
      name: widget.name,
      label: widget.label,
      hint: widget.hint,
      obscureText: _obscured,
      customSuffix: IconButton(
        onPressed: _toggleObscurity,
        icon: Icon(
          _obscured ? LucideIcons.eye : LucideIcons.eyeClosed,
          size: context.spaces.s24,
        ),
      ),
      validators: fieldValidators,
    );
  }
}
