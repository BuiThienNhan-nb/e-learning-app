import 'package:e_learning_app/features/main/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/colors.dart';
import '../../../utils/nav_bar/nav_bar_item.dart';
import '../../../utils/nav_bar/nav_bar_tab.dart';

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

  int _currentIndex = 0;

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
    _updateForCurrentTab();
  }

  void _updateForCurrentTab() {
    final location = GoRouter.of(context).location;
    _currentIndex = _locationToTabIndex(location);

    final NavBarTabNavigator tabNav = _tabs[_currentIndex];
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
      appBar: _currentIndex == 0 ? MainAppBar() : null,
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
            _tabs.map((NavBarTabNavigator e) => e.bottomNavigationTab).toList(),
        currentIndex: _currentIndex,
        onTap: (int idx) => _onItemTapped(idx, context),
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
    return IndexedStack(
      index: _currentIndex,
      children: _tabs
          .map((NavBarTabNavigator tab) => tab.buildNavigator(context))
          .toList(),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    GoRouter.of(context).go(_tabs[index].currentLocation);
  }
}
