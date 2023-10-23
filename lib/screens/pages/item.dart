import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/screens/pages/cart.dart';
import 'package:foodmenu/screens/widgets/search.dart';
import 'package:foodmenu/screens/widgets/tabs/All_item.dart';
import 'package:foodmenu/screens/widgets/tabs/drinks.dart';
import 'package:foodmenu/screens/widgets/tabs/Breakfast.dart';
import 'package:foodmenu/screens/widgets/tabs/Deserts.dart';

class item extends StatelessWidget {
  const item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getfood();
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 129, 44, 226),
          title: const Text(
            'item',
            style: TextStyle(
                color: Color.fromARGB(
                    255, 255, 255, 255)), // Set the text color to white
          ),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'all'),
              Tab(text: 'breakfast'),
              Tab(text: 'desserts'),
              Tab(text: 'beverage'),
            ],

            labelColor: Color.fromARGB(
                255, 255, 255, 255), // Set the selected tab text color to black
            unselectedLabelColor: Color.fromARGB(255, 126, 123, 123),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Search(),
                        ));
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const cart(),
                        ));
                  },
                  icon: const Icon(Icons.shopify_sharp),
                ),
              ],
            )
          ],
        ),
        body: TabBarView(
          children: [
            All_iteam(),
            // breakfast(),
            // desrets(),
            // bevarge(),
          ],
        ),
      ),
    );
  }
}
