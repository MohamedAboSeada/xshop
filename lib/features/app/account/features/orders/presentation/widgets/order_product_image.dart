import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../core/theme/tokens/theme_extensions.dart';

class OrderProductImage extends StatelessWidget {
  final String imageUrl;
  const OrderProductImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.spaces.s96.w,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(context.radius.r10.r),
              child: CachedNetworkImage(
                fit: .cover,
                imageUrl: imageUrl,
                placeholder: (context, url) {
                  return const Skeletonizer.zone(child: Bone.square());
                },
                errorWidget: (_, _, _) => ColoredBox(
                  color: context.colors.primary100,
                  child: const Icon(Icons.broken_image_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
