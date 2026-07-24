import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static const _designSize = Size(390.0, 844.0);

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.sizeOf(context).toString());
    return ScreenUtilInit(
      designSize: _designSize,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.routerConfig,

        themeMode: .light,
        theme: AppTheme.appTheme,

        /// preserve app ui form over text scaling
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);

          final systemScale = mediaQuery.textScaler.scale(1);
          final clampedScale = systemScale.clamp(0.9, 1.2);

          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: TextScaler.linear(clampedScale),
            ),
            child: DevicePreview.appBuilder(context, child),
          );
        },
      ),
    );
  }
}
