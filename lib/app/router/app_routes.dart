class AppRoutes {
  final String path;
  final String name;

  const AppRoutes._(this.path, {required this.name});

  static const login = AppRoutes._('/login', name: 'login');

  static const home = AppRoutes._('/home', name: 'home');
  static const search = AppRoutes._('/search', name: 'search');
  static const profile = AppRoutes._('/profile', name: 'profile');

  static const notifications = AppRoutes._(
    '/notifications',
    name: 'notifications',
  );
}
