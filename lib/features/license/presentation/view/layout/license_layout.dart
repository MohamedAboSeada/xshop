import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/tokens/theme_extensions.dart';

class LicenseLayout extends StatelessWidget {
  final String title;
  final String markdownPath;
  const LicenseLayout({
    super.key,
    required this.title,
    required this.markdownPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary0,
      appBar: AppBar(
        title: Text(title, style: context.typography.b1Semibold),
        titleSpacing: 0,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(markdownPath),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return SafeArea(
              child: Markdown(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.s24,
                  vertical: context.spaces.s24.h,
                ),
                selectable: true,
                data: asyncSnapshot.data!,
                styleSheet: MarkdownStyleSheet(
                  h1: context.typography.h2.copyWith(
                    color: context.colors.primary900,
                  ),
                  h1Padding: EdgeInsets.only(bottom: context.spaces.s16.h),

                  h2: context.typography.h3.copyWith(
                    color: context.colors.primary900,
                  ),
                  h2Padding: EdgeInsets.only(
                    top: context.spaces.s24.h,
                    bottom: context.spaces.s12.h,
                  ),

                  h3: context.typography.h4.copyWith(
                    color: context.colors.primary900,
                  ),
                  h3Padding: EdgeInsets.only(
                    top: context.spaces.s16.h,
                    bottom: context.spaces.s8.h,
                  ),

                  p: context.typography.b1Regular.copyWith(
                    color: context.colors.primary700,
                    height: 1.5,
                  ),
                  pPadding: EdgeInsets.only(bottom: context.spaces.s12.h),

                  strong: context.typography.b1Semibold.copyWith(
                    color: context.colors.primary900,
                  ),

                  blockquoteDecoration: BoxDecoration(
                    color: context.colors.primary100.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.all(context.radius.r8),
                    border: Border(
                      left: BorderSide(
                        color: context.colors.primary900,
                        width: 4.0,
                      ),
                    ),
                  ),
                  blockquotePadding: EdgeInsets.symmetric(
                    horizontal: context.spaces.s16,
                    vertical: context.spaces.s16.h,
                  ),
                  blockquote: context.typography.b1Medium.copyWith(
                    color: context.colors.primary800,
                    fontStyle: FontStyle.italic,
                    height: 1.5,
                  ),

                  horizontalRuleDecoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: context.colors.primary200),
                    ),
                  ),

                  listBullet: context.typography.b1Regular.copyWith(
                    color: context.colors.primary900,
                  ),
                  listIndent: 24.0,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(color: context.colors.primary900),
          );
        },
      ),
    );
  }
}
