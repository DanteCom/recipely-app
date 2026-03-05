import 'package:go_router/go_router.dart';
import 'package:recipely_app/app/router/app_routes.dart';
import 'package:recipely_app/features/home/home_page.dart';
import 'package:recipely_app/app/pages/app_shell_page.dart';
import 'package:recipely_app/features/login/login_page.dart';
import 'package:recipely_app/features/search/search_page.dart';
import 'package:recipely_app/features/profile/profile_page.dart';
import 'package:recipely_app/features/notifications/notifications_page.dart';

final routerConfig = GoRouter(
  initialLocation: AppRoutes.home.path,
  routes: [
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      builder: (context, state) => LoginPage(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShellPage(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              builder: (context, state) => HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.search.path,
              name: AppRoutes.search.name,
              builder: (context, state) => SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.notifications.path,
              name: AppRoutes.notifications.name,
              builder: (context, state) => NotificationsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile.path,
              name: AppRoutes.profile.name,
              builder: (context, state) => ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
