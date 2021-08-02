import 'package:flutter/material.dart';
import 'package:wapp/ui/pages/home/home.info.dart';
import 'package:wapp/ui/pages/home/home.preferences.dart';
import 'package:wapp/ui/widgets/bottom_navigation.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({
    Key? key,
    this.initialTab,
  }) : super(key: key);

  final int? initialTab;

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<Widget> screens = [
    MainPage(),
    PreferencesPage(),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: widget.initialTab ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigation(
        backgroundColor: Colors.green,
        activeIconColor: Colors.black,
        inactiveIconColor: Colors.white,
        animationDuration: Duration(milliseconds: 1000),
        height: 70,
        items: <NavigationBarItem>[
          NavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              title: '',
              onClick: () => handleTabChanging(0)),
          NavigationBarItem(
            icon: Icon(
              Icons.settings,
              // MPIcons.setting,
            ),
            title: '',
            onClick: () => handleTabChanging(1),
          )
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: screens,
        controller: tabController,
      ),
    );
  }

  void handleTabChanging(int index) {
    tabController.index = index;

    setState(() {});
  }
}
