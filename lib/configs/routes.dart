import 'package:e_learning_app/features/home/presentation/pages/home_page.dart';
import 'package:e_learning_app/utils/nav_bar/tab_bar_shell_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../bases/presentation/atoms/bottom_nav_bar.dart';
import '../features/auth/sign_in/presentation/pages/sign_in_page.dart';
import '../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart';
import '../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart';
import '../features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart';

// final GlobalKey<NavigatorState> _section1NavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'section1Nav');
// final GlobalKey<NavigatorState> _section2NavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'section2Nav');
// final GlobalKey<NavigatorState> _section3NavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'section3Nav');
// final GlobalKey<NavigatorState> _section4NavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'section4Nav');
// final GlobalKey<NavigatorState> _section5NavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'section5Nav');

class AppRoutes {
  AppRoutes._internal();

  static final AppRoutes instance = AppRoutes._internal();

  factory AppRoutes() {
    return instance;
  }

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final _bottomBarLocator = GetIt.I<BottomNavigationBarConfig>();

  // final String home = '/home';
  final String signIn = '/sign-in';
  final String signUp = '/sign-up';
  /*
  final List<String> mainPage = [
    '/home',
    '/explore',
    '/my-course',
    '/profile',
    '/settings',
  ];

  late final List<ScaffoldWithNavBarTabItem> _tabs = [
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[0],
      navigatorKey: _section1NavigatorKey,
      icon: const Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.black,
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[1],
      navigatorKey: _section2NavigatorKey,
      icon: const Icon(Icons.explore),
      label: 'Explore',
      backgroundColor: Colors.black,
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[2],
      navigatorKey: _section3NavigatorKey,
      icon: const Icon(Icons.note),
      label: 'My Course',
      backgroundColor: Colors.black,
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[3],
      navigatorKey: _section4NavigatorKey,
      icon: const Icon(Icons.person),
      label: 'Profile',
      backgroundColor: Colors.black,
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[4],
      navigatorKey: _section5NavigatorKey,
      icon: const Icon(Icons.settings),
      label: 'Settings',
      backgroundColor: Colors.red,
    ),
  ];*/
  String get initial => _bottomBarLocator.mainPage.first;

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initial,
    routes: <RouteBase>[
      GoRoute(
        path: signIn,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthPageProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<SignInStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const SignInPage(),
        ),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthPageProvider>(
              create: (BuildContext context) => GetIt.I(),
              lazy: true,
            ),
            Provider<SignUpStore>(
              create: (_) => GetIt.I(),
              lazy: true,
            ),
          ],
          child: const SignUpPage(),
        ),
      ),
      BottomTabBarShellRoute(
        tabs: _bottomBarLocator.tabs,
        routes: [
          GoRoute(
            path: _bottomBarLocator.mainPage[0],
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[1],
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[2],
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: _bottomBarLocator.mainPage[3],
            builder: (context, state) => const HomePage(),
          ),
        ],
      )
    ],
  );
}
