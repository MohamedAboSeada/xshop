import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../action_button.dart';
import '../../theme/tokens/theme_extensions.dart';

class AppForm extends StatefulWidget {
  final List<Widget> fields;
  final String submitLabel;
  final ValueChanged<Map<String, dynamic>> onSubmit;
  final bool isActionSeparated;
  final Widget? formFooter;
  final GlobalKey<FormBuilderState>? formKey;

  const AppForm({
    super.key,
    required this.fields,
    required this.submitLabel,
    required this.onSubmit,
    this.isActionSeparated = false,
    this.formFooter,
    this.formKey,
  });

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  late final GlobalKey<FormBuilderState> _formKey;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _formKey = widget.formKey ?? GlobalKey<FormBuilderState>();
  }

  void _onFormChanges() {
    final isValid = _formKey.currentState?.isValid ?? false;
    if (_isFormValid != isValid) {
      setState(() {
        _isFormValid = isValid;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      widget.onSubmit(_formKey.currentState!.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: _onFormChanges,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(spacing: context.spaces.s16.h, children: [...widget.fields]),
          if (widget.formFooter != null) ...[
            context.spaces.s16.verticalSpace,
            widget.formFooter!,
            context.spaces.s16.verticalSpace,
          ],
          if (widget.isActionSeparated) const Spacer(),
          ActionButton(
            label: widget.submitLabel,
            onPressed: _isFormValid ? _submit : null,
          ),
        ],
      ),
    );
  }
}
