import 'package:dummy_store/constants/app_theme.dart';
import 'package:dummy_store/views/cart_screen/cart_screen.dart';
import 'package:dummy_store/views/home_screen/home_screen.dart';
import 'package:dummy_store/views/favourite_screen/favourite_screen.dart';
import 'package:dummy_store/views/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.black26),
          backgroundColor: Colors.grey.shade50,
          currentIndex: currIndex,
          onTap: (val) {
            setState(() {
              currIndex = val;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
        body: screens[currIndex]);
  }
}
