import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/modules/layout_view/home_tab.dart';
import 'package:eventely/modules/layout_view/map_tab.dart';
import 'package:eventely/modules/layout_view/profile_tab.dart';
import 'package:flutter/material.dart';

import 'favorite_tab.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> tabs=[
    const HomeTab(),
    const MapTab(),
    const SizedBox(),
    const FavoriteTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PagesRouteName.createEvent);
        },
        shape: const CircleBorder(
            side: BorderSide(
          color: ColorPalette.white,
          width: 5,
        )),
        backgroundColor: ColorPalette.primaryColor,
        child: const Icon(
          Icons.add,
          color: ColorPalette.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPalette.primaryColor,
          selectedItemColor: ColorPalette.white,
          unselectedItemColor: ColorPalette.white,
          currentIndex: selectedIndex,
          onTap: _onItemTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "Map",
              activeIcon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "Favorites",
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
              activeIcon: Icon(Icons.person),
            ),
          ]),
      body: tabs[selectedIndex],
    );
  }

  _onItemTab(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
