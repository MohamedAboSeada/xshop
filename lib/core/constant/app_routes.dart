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

  static const terms = Route(path: 'terms', name: 'terms');
  static const policy = Route(path: 'privacy-policy', name: 'privacyPolicy');
  static const cookies = Route(path: 'cookies-policy', name: 'cookiesPolicy');
}
