import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../bases/presentation/atoms/bottom_nav_bar.dart';
import '../features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import '../features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart';
import '../features/auth/sign_in/presentation/pages/sign_in_page.dart';
import '../features/auth/sign_in/presentation/state/mobx/sign_in_store.dart';
import '../features/auth/sign_in/presentation/state/provider/auth_page_provider.dart';
import '../features/auth/sign_up/presentation/pages/sign_up_page.dart';
import '../features/auth/sign_up/presentation/state/mobx/sign_up_store.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/teacher_detail/presentation/pages/teacher_detail_page.dart';
import '../utils/nav_bar/tab_bar_shell_route.dart';

@lazySingleton
class AppRoutes {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final _bottomBarLocator = GetIt.I<BottomNavigationBarConfig>();

  final String signIn = '/sign-in';
  final String signUp = '/sign-up';
  final String forgotPassword = '/forgot-password';
  // final String teacherDetail = "/teacher-detail";
  late final String teacherDetail =
      "${_bottomBarLocator.mainPage.first}/teacher";
  // String get initial => signIn;
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
        path: forgotPassword,
        builder: (context, state) =>
            ChangeNotifierProvider<ForgotPasswordPageProvider>(
          create: (context) => GetIt.I(),
          lazy: true,
          child: const ForgotPasswordPage(),
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
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: "teacher",
        path: "${_bottomBarLocator.mainPage[0]}/teacher/:teacherId",
        builder: (context, state) {
          // final teacher = state.extra as TeacherModel;
          return TeacherDetailPage(
            teacherId: state.params["teacherId"] ?? "N/A",
          );
        },
      ),
      BottomTabBarShellRoute(
        tabs: _bottomBarLocator.tabs,
        routes: [
          GoRoute(
            path: _bottomBarLocator.mainPage[0],
            builder: (context, state) => const HomePage(),
            // routes: [
            //   GoRoute(
            //     name: "teacher",
            //     path: "teacher/:teacherId",
            //     builder: (context, state) {
            //       // final teacher = state.extra as TeacherModel;
            //       return TeacherDetailPage(
            //         teacherId: state.params["teacherId"] ?? "N/A",
            //       );
            //     },
            //   ),
            // ],
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
            builder: (context, state) => const Logout(),
          ),
        ],
      ),
      // GoRoute(
      //   path: teacherDetail,
      //   builder: (context, state) {
      //     final teacher = state.extra as TeacherModel;
      //     return TeacherDetailPage(teacher: teacher);
      //   },
      // ),
    ],
  );
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => GoRouter.of(context).go('/sign-in'),
          child: const Text("Log out!"),
        ),
      ),
    );
  }
}
