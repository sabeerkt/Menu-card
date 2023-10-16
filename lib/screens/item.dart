import 'package:flutter/material.dart';
import 'package:foodmenu/screens/widgets/all.dart';

import 'package:foodmenu/screens/widgets/bevarge.dart';
import 'package:foodmenu/screens/widgets/breakfast.dart';
import 'package:foodmenu/screens/widgets/desrt.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style:
                TextStyle(color: Colors.white), // Set the text color to white
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 178, 171, 171),
                  Color(0xFF043D5E)
                ], // Define the gradient colors
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'all'),
              Tab(text: 'breakfast'),
              Tab(text: 'desserts'),
              Tab(text: 'beverage'),
            ],
            labelColor:
                Colors.black, // Set the selected tab text color to black
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          children: [
            all(),
            breakfast(),
            desrets(),
            bevarge(),
          ],
        ),
      ),
    );
  }
}
