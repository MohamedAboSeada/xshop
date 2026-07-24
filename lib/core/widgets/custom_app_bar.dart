import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:xshop/core/theme/tokens/app_borders.dart';
import 'package:xshop/core/theme/tokens/theme_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  const CustomAppBar({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(bottom: context.borders.moreMutedBorder.toBorderSide()),
      automaticallyImplyLeading: false,
      titleSpacing: context.canPop()
          ? context.spaces.s16.w
          : context.spaces.s24.w,
      leadingWidth: context.spaces.s24.w + 24.r,
      leading: context.canPop()
          ? Padding(
              padding: EdgeInsetsDirectional.only(start: context.spaces.s24.w),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Colors.transparent,
                ),
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            )
          : null,
      title: title != null ? Text(title!, style: context.typography.h4) : null,
      actionsPadding: EdgeInsetsDirectional.only(end: context.spaces.s24.w),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
