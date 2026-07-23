import 'package:go_router/go_router.dart';
import '../workspace/workspace.dart';
import '../../features/auth/presentation/view/screens/forget_password_screen.dart';
import '../../features/auth/presentation/view/screens/reset_password_screen.dart';
import '../../features/auth/presentation/view/screens/verification_code_screen.dart';
import '../../features/license/presentation/view/screens/cookie_use_screen.dart';
import '../../features/license/presentation/view/screens/policy_screen.dart';
import '../../features/license/presentation/view/screens/terms_screen.dart';
import '../constant/app_routes.dart';
import '../../features/auth/presentation/view/screens/sign_in_screen.dart';
import '../../features/auth/presentation/view/screens/sign_up_screen.dart';
import '../../features/onboarding/presentation/view/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/view/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static final _initialLocation = AppRoutes.splash.path;

  static final routerConfig = GoRouter(
    initialLocation: _initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding.path,
        name: AppRoutes.onboarding.name,
        builder: ((context, state) => const OnboardingScreen()),
      ),
      GoRoute(
        path: AppRoutes.signIn.path,
        name: AppRoutes.signIn.name,
        builder: (context, state) => const SignInScreen(),
      ),

      GoRoute(
        path: AppRoutes.forgetPassword.path,
        name: AppRoutes.forgetPassword.name,
        builder: (context, state) => const ForgetPasswordScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.verifyEmail.path,
            name: AppRoutes.verifyEmail.name,
            builder: (context, state) => VerificationCodeScreen(
              email: state.uri.queryParameters["email"] as String,
            ),
          ),
          GoRoute(
            path: AppRoutes.resetPassword.path,
            name: AppRoutes.resetPassword.name,
            builder: (context, state) => const ResetPasswordScreen(),
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.signUp.path,
        name: AppRoutes.signUp.name,
        builder: (context, state) => const SignUpScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.terms.path,
            name: AppRoutes.terms.name,
            builder: (context, state) => const TermsScreen(),
          ),
          GoRoute(
            path: AppRoutes.policy.path,
            name: AppRoutes.policy.name,
            builder: (context, state) => const PolicyScreen(),
          ),
          GoRoute(
            path: AppRoutes.cookies.path,
            name: AppRoutes.cookies.name,
            builder: (context, state) => const CookieUseScreen(),
          ),
        ],
      ),

      // test route
      GoRoute(
        path: AppRoutes.workspace.path,
        name: AppRoutes.workspace.name,
        builder: (context, state) => const Workspace(),
      ),
    ],
  );
}
