import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:xshop/core/theme/tokens/app_borders.dart';
import 'package:xshop/core/theme/tokens/theme_extensions.dart';

class Distention {
  final String label;
  final IconData icon;

  const Distention({required this.label, required this.icon});
}

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppShell({super.key, required this.navigationShell});

  static const _distentions = [
    Distention(label: "Home", icon: LucideIcons.home400),
    Distention(label: "Search", icon: LucideIcons.search400),
    Distention(label: "Saved", icon: LucideIcons.bookmark400),
    Distention(label: "Cart", icon: LucideIcons.shoppingCart400),
    Distention(label: "Account", icon: LucideIcons.circleUserRound400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(
            top: context.borders.moreMutedBorder.toBorderSide(),
          ),
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: _distentions
              .map(
                (dist) => NavigationDestination(
                  icon: Icon(dist.icon),
                  label: dist.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
