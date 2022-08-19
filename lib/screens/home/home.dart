import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation/home_navigation_provider.dart';
import '../../utils/theme.dart';

import './project/project_page.dart';
import './user/user_page.dart';
import './settings/settings.dart';
import './custom_bottom_nav.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    /// [ homeNav ] is a [ HomeNavigationProvider ] which is used to change the current screen.
    final homeNav = Provider.of<HomeNavigation>(context);

    /// [ pages ] is a list of [ Widgets] which are used to display the current screen.
    final List<Widget> pages = [
      const UserPage(),
      const ProjectPage(),
      const SettingsPage(),
    ];

    Widget bodyWidget() {
      /// [ pages[homeNav.currentIndex] ] is used to display the current screen.
      return pages[homeNav.currentIndex];
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: KsSmartTheme.lightBlack,
        body: bodyWidget(),

        /// [ bottom navigation bar ] to navigate to other screens.
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}
