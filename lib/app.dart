import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'core/theme/styles/text_styles.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StyledText(
            "Define yourself in your unique way.",
            style: largeHeading,
          ),
        ),
      ),
    );
  }
}
