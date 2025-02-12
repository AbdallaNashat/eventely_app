import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/modules/layout_view/home_tab.dart';
import 'package:eventely/modules/layout_view/map_tab.dart';
import 'package:eventely/modules/layout_view/profile_tab.dart';
import 'package:flutter/material.dart';
import 'favorite_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var locale = AppLocalizations.of(context)!;

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
          selectedItemColor: ColorPalette.white,
          unselectedItemColor: ColorPalette.white,
          currentIndex: selectedIndex,
          onTap: _onItemTab,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: locale.home,
              activeIcon: const Icon(Icons.home),
            ),
             BottomNavigationBarItem(
              icon: const Icon(Icons.location_on_outlined),
              label: locale.map,
              activeIcon: const Icon(Icons.location_on),
            ),
             const BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              label: "",
            ),
             BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_outlined),
              label: locale.favorite,
              activeIcon: const Icon(Icons.favorite),
            ),
             BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              label: locale.profile ,
              activeIcon: const Icon(Icons.person),
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
