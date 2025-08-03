import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/theme/app_static_colors.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';
import '../theme/dark_blue_theme.dart';

class AppBottomNavBar extends StatelessWidget {
  final List<NavItemData> navBarItems;
  final int selectedIndex;

  const AppBottomNavBar({
    super.key,
    required this.navBarItems,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border(top: BorderSide(color: DelishopColors.lightGrey)),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        items: navBarItems.toNavigationBarItemsList(selectedIndex, context),
        currentIndex: selectedIndex,
        selectedItemColor: NavItemData.activeColor,
        showUnselectedLabels: true,
        enableFeedback: true,
        selectedLabelStyle: TextStyle(color: NavItemData.activeColor),
        unselectedLabelStyle: TextStyle(color: NavItemData.inactiveColor),
        unselectedItemColor: NavItemData.inactiveColor,
        onTap: (value) {
          if (value == selectedIndex) return;
          final Function(String route) whatTodo =
              selectedIndex == 0 ? context.pushRoute : context.popThenPushRoute;
          whatTodo(navBarItems[value].route);
        },
      ),
    );
  }
}

class NavItemData {
  final IconData activeIcon;
  final IconData? inactiveIcon;
  final String labelId;
  final String route;

  const NavItemData({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.labelId,
    required this.route,
  });


  static var activeColor = DarkBlueTheme.light().colorScheme.primary;
  static var inactiveColor = AppStaticColors.lightGrey;

  static const List<NavItemData> userNavItems = [
    NavItemData(
      activeIcon: Icons.home,
      inactiveIcon: Icons.home_outlined,
      labelId: 'Home',
      route: Routes.home,
    ),
    NavItemData(
      activeIcon: Icons.add,
      inactiveIcon: Icons.add,
      labelId: 'Create Post',
      route: Routes.createUpdatePost,
    ),
    NavItemData(
      activeIcon: Icons.search,
      inactiveIcon: Icons.search,
      labelId: 'Search',
      route: Routes.search,
    ),
    NavItemData(
      activeIcon: Icons.person,
      inactiveIcon: Icons.person_outline,
      labelId: 'Profile',
      route: Routes.profile,
    ),
  ];
}


extension NavItemDataHelper on List<NavItemData> {
  List<BottomNavigationBarItem> toNavigationBarItemsList(
      int selectedIndex, BuildContext context) {
    return map(
          (itemData) {
        return BottomNavigationBarItem(
            label: itemData.labelId.tr(context),
            tooltip: itemData.labelId.tr(context),
            activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(itemData.activeIcon)),
            icon: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Icon(itemData.inactiveIcon),
            ));
      },
    ).toList();
  }

  List<String> toRoutesList() {
    return map((itemData) => itemData.route).toList();
  }
}
