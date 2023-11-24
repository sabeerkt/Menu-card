import 'package:flutter/material.dart';
import 'package:foodmenu/Screens/Pages/cart.dart';
import 'package:foodmenu/Screens/Pages/home.dart';
import 'package:foodmenu/screens/pages/item.dart';
import 'package:foodmenu/screens/pages/setting.dart';
import 'package:foodmenu/screens/widgets/chart.dart';

class BottomBar extends StatefulWidget {
  final String name;
  final String cost;
  final String image;

  const BottomBar(
      {Key? key, required this.name, required this.cost, required this.image})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    Home(),
    Cart(),
    const item(
      name: '',
      cost: '',
      image: '',
      description: '',
    ),
    const chart(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: bottomBarPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: const Color.fromARGB(255, 250, 14, 14),
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            _buildNavItem("Home", Icons.house, 0),
            _buildNavItem("Cart", Icons.shopping_bag_sharp, 1),
            _buildNavItem("Item", Icons.restaurant, 2),
            _buildNavItem("Chart", Icons.pie_chart, 3),
            _buildNavItem("Setting", Icons.settings, 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String label, IconData icon, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        decoration: BoxDecoration(
          border: _currentIndex == index
              ? const Border(
                  top: BorderSide(width: 2.0, color: Colors.white),
                )
              : null,
        ),
        child: Icon(
          icon,
          color: _currentIndex == index
              ? const Color.fromARGB(255, 186, 34, 34)
              : const Color.fromARGB(255, 244, 239, 239),
        ),
      ),
    );
  }
}
