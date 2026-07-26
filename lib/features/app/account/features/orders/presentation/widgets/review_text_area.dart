import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';

class ReviewTextArea extends StatelessWidget {
  final String name;
  const ReviewTextArea({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      minLines: 3,
      maxLines: 10,
      decoration: InputDecoration(
        hintText: AppStrings.sheetWriteYourReview,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.spaces.s20.w,
          vertical: context.spaces.s14.h,
        ),
      ),
    );
  }
}
