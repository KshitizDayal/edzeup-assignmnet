import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import 'configurations/location_screen.dart';
import 'configurations/roles_screen.dart';
import 'configurations/user_screen.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({super.key});

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  TabBar get _tabBar => const TabBar(
        indicatorColor: primaryColor,
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabs: [Tab(text: "Location"), Tab(text: "Roles"), Tab(text: "Users")],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: ColoredBox(
            color: whiteColor,
            child: _tabBar,
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            LocationScreen(),
            RolesScreen(),
            UserScreen(),
          ],
        ),
      ),
    );
  }
}
