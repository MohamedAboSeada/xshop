import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../constant/app_strings.dart';
import '../../theme/tokens/theme_extensions.dart';

import 'form_text_field.dart';

enum PasswordFieldType { login, signUp, confirm }

class PasswordField extends StatefulWidget {
  final String name;
  final String hint;
  final String label;
  final PasswordFieldType type;

  final String? Function()? matchValue;

  const PasswordField({
    super.key,
    required this.name,
    required this.hint,
    required this.label,
    this.type = PasswordFieldType.login,
    this.matchValue,
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

  FormFieldValidator<String> _getValidators() {
    switch (widget.type) {
      case PasswordFieldType.signUp:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: AppStrings.passwordRequired,
          ),
          FormBuilderValidators.password(errorText: AppStrings.strongPassword),
        ]);

      case PasswordFieldType.confirm:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: AppStrings.passwordRequired,
          ),
          (value) {
            final expectedPassword = widget.matchValue?.call();
            if (value != expectedPassword) {
              return 'Passwords do not match';
            }
            return null;
          },
        ]);

      case PasswordFieldType.login:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: AppStrings.passwordRequired,
          ),
          FormBuilderValidators.minLength(
            8,
            errorText: AppStrings.passwordLength,
          ),
        ]);
    }
  }

  @override
  Widget build(BuildContext context) {
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
      validators: _getValidators(),
    );
  }
}
