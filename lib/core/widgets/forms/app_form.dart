import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../action_button.dart';
import '../../theme/tokens/theme_extensions.dart';

class AppForm extends StatefulWidget {
  final List<Widget> fields;
  final String submitLabel;
  final ValueChanged<Map<String, dynamic>> onSubmit;

  const AppForm({
    super.key,
    required this.fields,
    required this.submitLabel,
    required this.onSubmit,
  });

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isFormValid = false;

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
        spacing: context.spaces.s16.h,
        children: [
          ...widget.fields,

          ActionButton(
            label: widget.submitLabel,
            onPressed: _isFormValid ? _submit : null,
          ),
        ],
      ),
    );
  }
}
