import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
import '../../../../utils/nav_bar/nav_bar_item.dart';
import '../../../../utils/nav_bar/nav_bar_tab.dart';
import '../mobx/main_page_store.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.currentNavigator,
    required this.currentRouterState,
    required this.tabs,
    required this.routes,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigator for the currently active tab
  final Navigator currentNavigator;

  /// The pages for the current route
  List<Page<dynamic>> get pagesForCurrentRoute => currentNavigator.pages;

  /// The current router state
  final GoRouterState currentRouterState;

  /// The tabs
  final List<ScaffoldWithNavBarTabItem> tabs;

  // The routes
  final List<RouteBase> routes;

  @override
  State<StatefulWidget> createState() => ScaffoldWithNavBarState();
}

/// State for ScaffoldWithNavBar
class ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  late final List<NavBarTabNavigator> _tabs;

  //
  int _locationToTabIndex(String location) {
    final int index = _tabs.indexWhere(
      (NavBarTabNavigator t) => location.startsWith(t.rootRoutePath),
    );
    return index < 0 ? 0 : index;
  }

  MainPageStore? store;

  @override
  void initState() {
    super.initState();
    _tabs = widget.tabs
        .map((ScaffoldWithNavBarTabItem e) => NavBarTabNavigator(e))
        .toList();
  }

  @override
  void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateForCurrentTab();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store ??= GetIt.I<MainPageStore>();
    _updateForCurrentTab();
  }

  void _updateForCurrentTab() {
    final location = GoRouter.of(context).location;
    store!.pageIndex = _locationToTabIndex(location);

    final NavBarTabNavigator tabNav = _tabs[store!.pageIndex];
    tabNav.pages = widget.pagesForCurrentRoute;
    tabNav.lastLocation = location;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: store!.pageIndex == 0 ? MainAppBar() : null,
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
            _tabs.map((NavBarTabNavigator e) => e.bottomNavigationTab).toList(),
        currentIndex: store!.pageIndex,
        onTap: (int idx) =>
            store!.onPageChanged(idx, context, _tabs[idx].currentLocation),
        selectedLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: IndexedStack(
        index: store!.pageIndex,
        children: _tabs
            .map((NavBarTabNavigator tab) => tab.buildNavigator(context))
            .toList(),
      ),
    );
  }

  // void _onItemTapped(int index, BuildContext context) {
  //   GoRouter.of(context).go(_tabs[index].currentLocation);
  // }
}
