import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pinput/pinput.dart';
import '../../theme/tokens/app_borders.dart';
import '../../theme/tokens/theme_extensions.dart';

class OtpField extends StatefulWidget {
  final String name;
  final int length;
  final bool enabled;
  final bool autoFocus;

  const OtpField({
    super.key,
    required this.name,
    required this.length,
    this.enabled = true,
    this.autoFocus = true,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: context.spaces.s64,
      height: context.spaces.s64,
      textStyle: context.typography.h2,
      decoration: BoxDecoration(
        color: context.colors.primary0,
        border: context.borders.mutedBorder,
        borderRadius: .all(context.radius.r10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyBorderWith(
      border: .fromBorderSide(
        context.borders.focusedBorder.withWidth(2).toBorderSide(),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyBorderWith(
      border: .fromBorderSide(
        context.borders.errorBorder.withWidth(2).toBorderSide(),
      ),
    );

    return FormBuilderField<String>(
      name: widget.name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.minLength(widget.length),
      ]),
      builder: (field) {
        if (_controller.text != (field.value ?? '')) {
          _controller.text = field.value ?? '';
        }

        return Pinput(
          controller: _controller,
          autofocus: widget.autoFocus,
          enabled: widget.enabled,
          onChanged: field.didChange,
          length: widget.length,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
          forceErrorState: field.hasError,
          errorText: field.errorText,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
      },
    );
  }
}
