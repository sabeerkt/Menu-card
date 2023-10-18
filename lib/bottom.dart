import 'package:flutter/material.dart';
import 'package:foodmenu/screens/cart.dart';
import 'package:foodmenu/screens/item.dart';

import 'package:foodmenu/screens/home.dart';
import 'package:foodmenu/screens/setting.dart';
import 'package:foodmenu/screens/widgets/chart.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> bottomBarPages = [
    const home(),
    cart(),
    const item(),
    chart(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: bottomBarPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF043D5E), // Set the background color to black
        selectedItemColor: Colors.white, // Set the selected item color to white
        unselectedItemColor: Colors.white,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              // Icons.home_sharp,
              Icons.house,

              color: Color.fromARGB(255, 244, 239, 239),
            ),
          ),
          BottomNavigationBarItem(
            label: "cart",
            icon: Icon(
              Icons.shopping_bag_sharp,
              color: Color.fromARGB(255, 244, 239, 239),
            ),
          ),
          BottomNavigationBarItem(
            label: "item",
            icon: Icon(
              Icons.restaurant,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          BottomNavigationBarItem(
            label: "chart",
            icon: Icon(
              Icons.pie_chart,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          BottomNavigationBarItem(
            label: "setting",
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
