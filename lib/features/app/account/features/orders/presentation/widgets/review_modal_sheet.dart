import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/theme/tokens/app_borders.dart';
import '../../../../../../../core/theme/tokens/theme_extensions.dart';
import '../../../../../../../core/widgets/action_button.dart';
import 'review_rating_bar.dart';
import 'review_text_area.dart';

class ReviewModalSheet extends StatefulWidget {
  const ReviewModalSheet({super.key});

  @override
  State<ReviewModalSheet> createState() => _ReviewModalSheetState();
}

class _ReviewModalSheetState extends State<ReviewModalSheet> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ListView(
        children: [
          _buildSheetHeader(context),
          FormBuilder(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spaces.s24.w,
                vertical: context.spaces.s16.h,
              ),
              child: Column(
                spacing: 20.0.h,
                crossAxisAlignment: .stretch,
                children: [
                  _buildSheetTitle(context),
                  const ReviewRatingBar(name: AppStrings.fieldRate),
                  const ReviewTextArea(name: AppStrings.fieldReview),
                  ActionButton(
                    label: AppStrings.submit,
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        debugPrint(_formKey.currentState!.value.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSheetHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.spaces.s8.h,
        left: context.spaces.s24.w,
        right: context.spaces.s12.w,
        bottom: context.spaces.s8.h,
      ),
      decoration: BoxDecoration(
        border: BoxBorder.fromSTEB(
          bottom: context.borders.moreMutedBorder.toBorderSide(),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(AppStrings.review, style: context.typography.h4),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(LucideIcons.x),
          ),
        ],
      ),
    );
  }

  Column _buildSheetTitle(BuildContext context) {
    return Column(
      spacing: context.spaces.s4.h,
      crossAxisAlignment: .start,
      children: [
        Text(AppStrings.sheetTitle, style: context.typography.b1Semibold),
        Text(
          AppStrings.sheetSubtitle,
          style: context.typography.b2Regular.copyWith(
            color: context.colors.primary500,
          ),
        ),
      ],
    );
  }
}
