import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/tokens/theme_extensions.dart';

/// Used to created Single Sign-In Button with fully
/// Customization.
class SSOButton extends StatelessWidget {
  final bool isOutlined;
  final String label;
  final String icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;

  const SSOButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isOutlined = true,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.spaces.s56.h,
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        borderRadius: .all(context.radius.r10.r),
        border: isOutlined
            ? BoxBorder.all(color: context.colors.primary200)
            : null,
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            spacing: context.spaces.s12.w,
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                icon,
                width: context.spaces.s24.w,
                height: context.spaces.s24.h,
              ),
              Text(
                label,
                style: context.typography.b1Medium.copyWith(
                  color: foregroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
