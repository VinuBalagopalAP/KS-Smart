import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation/home_navigation_provider.dart';
import '../../utils/theme.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeNav = Provider.of<HomeNavigation>(context);

    return BottomNavigationBar(
      fixedColor: KsSmartTheme.black,
      showUnselectedLabels: false,
      currentIndex: homeNav.currentIndex,
      onTap: homeNav.setIndex,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
