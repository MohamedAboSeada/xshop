class Route {
  final String path;
  final String name;

  const Route({required this.path, required this.name});
}

class AppRoutes {
  AppRoutes._();

  static const splash = Route(path: '/', name: 'splash');
  static const onboarding = Route(path: '/onboarding', name: 'onboarding');
  static const signUp = Route(path: '/sign-up', name: 'signUp');
  static const signIn = Route(path: '/sign-in', name: 'signIn');

  static const forgetPassword = Route(
    path: '/forgot-password',
    name: 'forgotPassword',
  );
  static const verifyEmail = Route(path: 'verify', name: 'verifyEmail');
  static const resetPassword = Route(path: 'reset', name: 'resetPassword');

  static const terms = Route(path: 'terms', name: 'terms');
  static const policy = Route(path: 'privacy-policy', name: 'privacyPolicy');
  static const cookies = Route(path: 'cookies-policy', name: 'cookiesPolicy');

  /// app routes
  static const home = Route(path: '/home', name: 'home');
  static const search = Route(path: '/search', name: 'search');
  static const saved = Route(path: '/saved', name: 'saved');
  static const cart = Route(path: '/cart', name: 'cart');
  static const account = Route(path: '/account', name: 'account');

  // account routes
  static const helpCenter = Route(path: 'help-center', name: 'helpCenter');

  // test route
  static const workspace = Route(path: '/workspace', name: 'workspace');
}
