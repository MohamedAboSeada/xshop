import 'package:flutter/material.dart';
import '../../features/auth/presentation/view/screens/verification_code_screen.dart';

class Workspace extends StatelessWidget {
  const Workspace({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationCodeScreen(email: "madoaxel287@gmail.com"),
    );
  }
}
