import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:restaraunts/Pages/auth_pages/enter_page.dart';
import 'package:restaraunts/Pages/auth_pages/forgot_password.dart';
import 'package:restaraunts/Pages/auth_pages/login_page.dart';
import 'package:restaraunts/Pages/auth_pages/registration_page.dart';
import 'package:restaraunts/Pages/child_pages/favorites.dart';
import 'package:restaraunts/Pages/child_pages/partys_page.dart';
import 'package:restaraunts/Pages/child_pages/person_info.dart';
import 'package:restaraunts/Pages/child_pages/profila_page.dart';
import 'package:restaraunts/Pages/child_pages/rest_info.dart';
import 'package:restaraunts/Pages/child_pages/review_page.dart';
import 'package:restaraunts/Pages/on_boarding_page.dart';
import '../Pages/bottom_navigation_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: OnBoardingPage, initial: true),
    AutoRoute(page: AuthPage, path: '/auth'),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: RegistrationPage, path: '/registration'),
    AutoRoute(page: ForgotPassword, path: '/forgot'),
    AutoRoute<void>(
      path: '/bottomnavpage',
      page: BottomNavPage,
      children: [
        AutoRoute<void>(
          path: 'review',
          name: 'ReviewRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              path: '',
              name: 'ReviewPageRouter',
              page: ReviewPage,
            ),
            AutoRoute<void>(
              path: ':infoId',
              name: 'InfoRestRouter',
              page: InfoRest,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'partys',
          name: 'PartysRouter',
          page: Partys,
        ),
        AutoRoute<void>(
          path: 'profile',
          name: 'ProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              name: 'ProfilePageRouter',
              page: ProfilaPage,
            ),
            AutoRoute(
              path: ':personId',
              name: 'PersonInfoRouter',
              page: PersonInfo,
            ),
            AutoRoute(
                path: ':favoriteId',
                name: 'FavoritesPageRouter',
                page: FavoritesPage),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
