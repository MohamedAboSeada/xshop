import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xshop/features/onboarding/presentation/view/screens/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static const _designSize = Size(390.0, 844.0);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _designSize,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),

        /// preserve app ui form over text scaling
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);

          final systemScale = mediaQuery.textScaler.scale(1);
          final clampedScale = systemScale.clamp(0.9, 1.2);

          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaler: TextScaler.linear(clampedScale),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
