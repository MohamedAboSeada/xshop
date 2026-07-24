import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/page_title.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

class AuthLayout extends StatelessWidget {
  final Widget form;
  final Widget? extra;
  final Widget switcher;
  final String title;
  final String subtitle;

  const AuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.form,
    required this.switcher,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spaces.s24.w,
                vertical: context.spaces.s12.h,
              ),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(
                    child: PageTitle(title: title, subtitle: subtitle),
                  ),
                  _buildVSpace(context, context.spaces.s24.h),
                  SliverToBoxAdapter(child: form),
                  _buildVSpace(context, context.spaces.s24.h),
                  if (extra != null) _buildOrDivider(context),
                  _buildVSpace(context, context.spaces.s24.h),
                  if (extra != null) SliverToBoxAdapter(child: extra),
                  _buildVSpace(context, context.spaces.s16.h),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(alignment: .bottomCenter, child: switcher),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildOrDivider(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(child: Divider(endIndent: context.spaces.s8.w)),
          Text(
            "OR",
            style: context.typography.b2Regular.copyWith(
              color: context.colors.primary500,
            ),
          ),
          Expanded(child: Divider(indent: context.spaces.s8.w)),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildVSpace(BuildContext context, double space) =>
      SliverToBoxAdapter(child: space.verticalSpace);
}
