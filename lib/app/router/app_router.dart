import 'package:go_router/go_router.dart';
import 'package:recipely_app/app/router/app_routes.dart';
import 'package:recipely_app/features/home/home_page.dart';
import 'package:recipely_app/app/pages/app_shell_page.dart';
import 'package:recipely_app/features/login/login_page.dart';
import 'package:recipely_app/features/search/pages/search_page.dart';
import 'package:recipely_app/features/profile/pages/profile_page.dart';
import 'package:recipely_app/features/notifications/notifications_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.login.path,
  routes: [
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginPage(),
    ),

    StatefulShellRoute.indexedStack(
      pageBuilder: (context, state, navigationShell) =>
          NoTransitionPage(child: AppShellPage(navigationShell)),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search.path,
              name: AppRoutes.search.name,
              builder: (context, state) => const SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notifications.path,
              name: AppRoutes.notifications.name,
              builder: (context, state) => const NotificationsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile.path,
              name: AppRoutes.profile.name,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
