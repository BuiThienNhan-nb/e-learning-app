import 'package:flutter/material.dart';

class SliverAppBarTab extends Container implements PreferredSizeWidget {
  SliverAppBarTab({
    super.key,
    required this.color,
    required this.tabBar,
  });

  // ignore: overridden_fields, annotate_overrides
  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: color,
        child: Center(
          child: tabBar,
        ),
      );
}
