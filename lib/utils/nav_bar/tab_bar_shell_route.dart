import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'nav_bar_item.dart';

/// ShellRoute that uses a bottom tab navigation (ScaffoldWithNavBar) with
/// separate navigators for each tab.
/// NOTE: This is not an optimal implementation and should ideally be
/// implemented in go_router, although in a way that doesn't use a navigator.
class BottomTabBarShellRoute extends ShellRoute {
  final List<ScaffoldWithNavBarTabItem> tabs;
  BottomTabBarShellRoute({
    required this.tabs,
    GlobalKey<NavigatorState>? navigatorKey,
    List<RouteBase> routes = const <RouteBase>[],
    Key? scaffoldKey = const ValueKey('ScaffoldWithNavBar'),
  }) : super(
          navigatorKey: navigatorKey,
          routes: routes,
          builder: (context, state, Widget fauxNav) {
            return Stack(
              children: [
                // Needed to keep the (faux) shell navigator alive
                Offstage(child: fauxNav),
                // ScaffoldWithNavBar(
                //   tabs: tabs,
                //   key: scaffoldKey,
                //   currentNavigator: fauxNav as Navigator,
                //   currentRouterState: state,
                //   routes: routes,
                // ),
              ],
            );
          },
        );
}
