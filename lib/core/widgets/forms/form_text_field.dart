import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:string_validator/string_validator.dart';
import '../../constant/app_durations.dart';
import '../../theme/tokens/app_borders.dart';

import '../../theme/tokens/theme_extensions.dart';

class FormTextField extends StatefulWidget {
  final String name;
  final String label;
  final String? hint;
  final FormFieldValidator<String>? validators;
  final bool obscureText;
  final Widget? customSuffix;

  const FormTextField({
    super.key,
    required this.name,
    required this.label,
    this.hint,
    this.validators,
    this.obscureText = false,
    this.customSuffix,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  final _fieldState = GlobalKey<FormBuilderFieldState>();
  var _isFieldValid = false;
  var _isDirty = false;
  var _isEmpty = true;

  void _onFieldChange(String? value) {
    if (value == null) return;
    setState(() {
      _isEmpty = value.isEmpty;
      _isDirty = _fieldState.currentState?.isDirty ?? false;
      _isFieldValid = _fieldState.currentState?.isValid ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final successBorder = _isFieldValid
        ? _buildBorder(context.borders.successBorder, width: 2.0)
        : null;

    return Column(
      crossAxisAlignment: .start,
      spacing: context.spaces.s4.h,
      children: [
        Text(widget.label, style: context.typography.b1Medium),
        FormBuilderTextField(
          key: _fieldState,
          autovalidateMode: .onUserInteraction,
          name: widget.name,
          valueTransformer: (value) {
            if (value == null) return null;
            final email = isEmail(value);
            return email
                ? normalizeEmail(escape(value.trim()))
                : escape(value.trim().toLowerCase());
          },
          obscureText: widget.obscureText,
          onChanged: _onFieldChange,
          validator: widget.validators,
          style: context.typography.b1Medium,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefix: context.spaces.s16.horizontalSpace,
            suffixIcon: _getSuffixIcon(),
            enabledBorder: successBorder,
            focusedBorder: successBorder,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildBorder(BoxBorder border, {double width = 1.0}) {
    return border
        .withWidth(width)
        .toOutlineInputBorder(
          borderRadius: BorderRadius.all(context.radius.r10),
        );
  }

  Widget? _getSuffixIcon() {
    if (widget.customSuffix != null) return widget.customSuffix;
    if (_isEmpty && !_isDirty) return null;
    final key = _isFieldValid ? "valid" : "invalid";

    return AnimatedSwitcher(
      duration: AppDurations.fast,
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Icon(
        key: ValueKey(key),
        _isFieldValid ? LucideIcons.circleCheck : LucideIcons.circleAlert,
        size: context.spaces.s24,
        color: _isFieldValid ? context.colors.success : context.colors.danger,
      ),
    );
  }
}
