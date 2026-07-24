import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xshop/core/widgets/custom_app_bar.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';
import '../widgets/page_title.dart';

class PasswordResetLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget form;

  const PasswordResetLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.spaces.s24.r),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PageTitle(title: title, subtitle: subtitle),
              ),
              _buildVSpace(context),
              SliverFillRemaining(hasScrollBody: false, child: form),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildVSpace(BuildContext context) =>
      SliverToBoxAdapter(child: context.spaces.s24.verticalSpace);
}
