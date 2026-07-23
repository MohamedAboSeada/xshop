import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: context.spaces.s12,
        title: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.spaces.s24.w,
            right: context.spaces.s24.w,
            bottom: context.spaces.s24.w,
            top: context.spaces.s12.w,
          ),
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
