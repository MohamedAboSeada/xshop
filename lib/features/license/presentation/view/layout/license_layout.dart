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
                padding: EdgeInsets.fromLTRB(
                  context.spaces.s24,
                  context.spaces.s16.h,
                  context.spaces.s24,
                  context.spaces.s32.h,
                ),
                selectable: true,
                data: asyncSnapshot.data!,
                styleSheet: MarkdownStyleSheet(
                  h1: context.typography.h2.copyWith(
                    color: context.colors.primary900,
                    height: 1,
                  ),
                  h1Padding: EdgeInsets.only(bottom: context.spaces.s4.h),

                  h2: context.typography.h4.copyWith(
                    color: context.colors.primary900,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  h2Padding: EdgeInsets.only(
                    top: context.spaces.s8.h,
                    bottom: context.spaces.s8.h,
                  ),

                  p: context.typography.b1Regular.copyWith(
                    color: context.colors.primary600,
                    height: 1.7,
                  ),
                  pPadding: EdgeInsets.only(bottom: context.spaces.s4.h),

                  listBullet: context.typography.b1Regular.copyWith(
                    color: context.colors.primary600,
                    height: 1,
                  ),

                  strong: context.typography.b1Semibold.copyWith(
                    color: context.colors.primary900,
                  ),

                  em: context.typography.b1Regular.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colors.primary500,
                  ),
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
