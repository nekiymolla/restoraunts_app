// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:auto_route/empty_router_widgets.dart' as _i7;
import 'package:flutter/material.dart' as _i15;

import '../Pages/auth_pages/enter_page.dart' as _i2;
import '../Pages/auth_pages/forgot_password.dart' as _i5;
import '../Pages/auth_pages/login_page.dart' as _i3;
import '../Pages/auth_pages/registration_page.dart' as _i4;
import '../Pages/bottom_navigation_page.dart' as _i6;
import '../Pages/child_pages/favorites.dart' as _i13;
import '../Pages/child_pages/partys_page.dart' as _i8;
import '../Pages/child_pages/person_info.dart' as _i12;
import '../Pages/child_pages/profila_page.dart' as _i11;
import '../Pages/child_pages/rest_info.dart' as _i10;
import '../Pages/child_pages/review_page.dart' as _i9;
import '../Pages/on_boarding_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    OnBoardingPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OnBoardingPage(),
      );
    },
    AuthPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    RegistrationPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RegistrationPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ForgotPassword(),
      );
    },
    BottomNavPageRoute.name: (routeData) {
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: const _i6.BottomNavPage(),
      );
    },
    ReviewRouter.name: (routeData) {
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: const _i7.EmptyRouterPage(),
      );
    },
    PartysRouter.name: (routeData) {
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: const _i8.Partys(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: const _i7.EmptyRouterPage(),
      );
    },
    ReviewPageRouter.name: (routeData) {
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: const _i9.ReviewPage(),
      );
    },
    InfoRestRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<InfoRestRouterArgs>(
          orElse: () =>
              InfoRestRouterArgs(infoId: pathParams.getInt('infoId')));
      return _i14.MaterialPageX<void>(
        routeData: routeData,
        child: _i10.InfoRest(
          key: args.key,
          infoId: args.infoId,
        ),
      );
    },
    ProfilePageRouter.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ProfilaPage(),
      );
    },
    PersonInfoRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PersonInfoRouterArgs>(
          orElse: () =>
              PersonInfoRouterArgs(personId: pathParams.getInt('personId')));
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.PersonInfo(
          key: args.key,
          personId: args.personId,
        ),
      );
    },
    FavoritesPageRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FavoritesPageRouterArgs>(
          orElse: () => FavoritesPageRouterArgs(
              favoriteId: pathParams.getInt('favoriteId')));
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.FavoritesPage(
          key: args.key,
          favoriteId: args.favoriteId,
        ),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          OnBoardingPageRoute.name,
          path: '/',
        ),
        _i14.RouteConfig(
          AuthPageRoute.name,
          path: '/auth',
        ),
        _i14.RouteConfig(
          LoginPageRoute.name,
          path: '/login',
        ),
        _i14.RouteConfig(
          RegistrationPageRoute.name,
          path: '/registration',
        ),
        _i14.RouteConfig(
          ForgotPasswordRoute.name,
          path: '/forgot',
        ),
        _i14.RouteConfig(
          BottomNavPageRoute.name,
          path: '/bottomnavpage',
          children: [
            _i14.RouteConfig(
              ReviewRouter.name,
              path: 'review',
              parent: BottomNavPageRoute.name,
              children: [
                _i14.RouteConfig(
                  ReviewPageRouter.name,
                  path: '',
                  parent: ReviewRouter.name,
                ),
                _i14.RouteConfig(
                  InfoRestRouter.name,
                  path: ':infoId',
                  parent: ReviewRouter.name,
                ),
              ],
            ),
            _i14.RouteConfig(
              PartysRouter.name,
              path: 'partys',
              parent: BottomNavPageRoute.name,
            ),
            _i14.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: BottomNavPageRoute.name,
              children: [
                _i14.RouteConfig(
                  ProfilePageRouter.name,
                  path: '',
                  parent: ProfileRouter.name,
                ),
                _i14.RouteConfig(
                  PersonInfoRouter.name,
                  path: ':personId',
                  parent: ProfileRouter.name,
                ),
                _i14.RouteConfig(
                  FavoritesPageRouter.name,
                  path: ':favoriteId',
                  parent: ProfileRouter.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingPageRoute extends _i14.PageRouteInfo<void> {
  const OnBoardingPageRoute()
      : super(
          OnBoardingPageRoute.name,
          path: '/',
        );

  static const String name = 'OnBoardingPageRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthPageRoute extends _i14.PageRouteInfo<void> {
  const AuthPageRoute()
      : super(
          AuthPageRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPageRoute extends _i14.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: '/login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationPageRoute extends _i14.PageRouteInfo<void> {
  const RegistrationPageRoute()
      : super(
          RegistrationPageRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationPageRoute';
}

/// generated route for
/// [_i5.ForgotPassword]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot',
        );

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i6.BottomNavPage]
class BottomNavPageRoute extends _i14.PageRouteInfo<void> {
  const BottomNavPageRoute({List<_i14.PageRouteInfo>? children})
      : super(
          BottomNavPageRoute.name,
          path: '/bottomnavpage',
          initialChildren: children,
        );

  static const String name = 'BottomNavPageRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ReviewRouter extends _i14.PageRouteInfo<void> {
  const ReviewRouter({List<_i14.PageRouteInfo>? children})
      : super(
          ReviewRouter.name,
          path: 'review',
          initialChildren: children,
        );

  static const String name = 'ReviewRouter';
}

/// generated route for
/// [_i8.Partys]
class PartysRouter extends _i14.PageRouteInfo<void> {
  const PartysRouter()
      : super(
          PartysRouter.name,
          path: 'partys',
        );

  static const String name = 'PartysRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ProfileRouter extends _i14.PageRouteInfo<void> {
  const ProfileRouter({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i9.ReviewPage]
class ReviewPageRouter extends _i14.PageRouteInfo<void> {
  const ReviewPageRouter()
      : super(
          ReviewPageRouter.name,
          path: '',
        );

  static const String name = 'ReviewPageRouter';
}

/// generated route for
/// [_i10.InfoRest]
class InfoRestRouter extends _i14.PageRouteInfo<InfoRestRouterArgs> {
  InfoRestRouter({
    _i15.Key? key,
    required int infoId,
  }) : super(
          InfoRestRouter.name,
          path: ':infoId',
          args: InfoRestRouterArgs(
            key: key,
            infoId: infoId,
          ),
          rawPathParams: {'infoId': infoId},
        );

  static const String name = 'InfoRestRouter';
}

class InfoRestRouterArgs {
  const InfoRestRouterArgs({
    this.key,
    required this.infoId,
  });

  final _i15.Key? key;

  final int infoId;

  @override
  String toString() {
    return 'InfoRestRouterArgs{key: $key, infoId: $infoId}';
  }
}

/// generated route for
/// [_i11.ProfilaPage]
class ProfilePageRouter extends _i14.PageRouteInfo<void> {
  const ProfilePageRouter()
      : super(
          ProfilePageRouter.name,
          path: '',
        );

  static const String name = 'ProfilePageRouter';
}

/// generated route for
/// [_i12.PersonInfo]
class PersonInfoRouter extends _i14.PageRouteInfo<PersonInfoRouterArgs> {
  PersonInfoRouter({
    _i15.Key? key,
    required int personId,
  }) : super(
          PersonInfoRouter.name,
          path: ':personId',
          args: PersonInfoRouterArgs(
            key: key,
            personId: personId,
          ),
          rawPathParams: {'personId': personId},
        );

  static const String name = 'PersonInfoRouter';
}

class PersonInfoRouterArgs {
  const PersonInfoRouterArgs({
    this.key,
    required this.personId,
  });

  final _i15.Key? key;

  final int personId;

  @override
  String toString() {
    return 'PersonInfoRouterArgs{key: $key, personId: $personId}';
  }
}

/// generated route for
/// [_i13.FavoritesPage]
class FavoritesPageRouter extends _i14.PageRouteInfo<FavoritesPageRouterArgs> {
  FavoritesPageRouter({
    _i15.Key? key,
    required int favoriteId,
  }) : super(
          FavoritesPageRouter.name,
          path: ':favoriteId',
          args: FavoritesPageRouterArgs(
            key: key,
            favoriteId: favoriteId,
          ),
          rawPathParams: {'favoriteId': favoriteId},
        );

  static const String name = 'FavoritesPageRouter';
}

class FavoritesPageRouterArgs {
  const FavoritesPageRouterArgs({
    this.key,
    required this.favoriteId,
  });

  final _i15.Key? key;

  final int favoriteId;

  @override
  String toString() {
    return 'FavoritesPageRouterArgs{key: $key, favoriteId: $favoriteId}';
  }
}
