import 'package:flutter/material.dart';
import 'package:foodmenu/view/cart_screen/cart.dart';
import 'package:foodmenu/view/chart_screen/chart.dart';
import 'package:foodmenu/view/newdish_screen/home.dart';
import 'package:foodmenu/view/item_screen/item.dart';
import 'package:foodmenu/view/setting_screen/setting.dart';



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
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          selectedItemColor: Color.fromARGB(255, 34, 150, 186),
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
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
                  top: BorderSide(
                      width: 2.0, color: Color.fromARGB(255, 0, 0, 0)),
                )
              : null,
        ),
        child: Icon(
          icon,
          color: _currentIndex == index
              ? Color.fromARGB(255, 34, 150, 186)
              : Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
