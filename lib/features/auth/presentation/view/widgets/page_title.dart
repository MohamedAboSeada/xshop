import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spaces.s8.h,
      crossAxisAlignment: .start,
      children: [
        Text(title, style: context.typography.h2),
        Text(
          subtitle,
          style: context.typography.b1Regular.copyWith(
            color: context.colors.primary500,
          ),
        ),
      ],
    );
  }
}
