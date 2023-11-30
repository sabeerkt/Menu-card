import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/view/sesrch_screen/search.dart';
import 'package:foodmenu/view/widgets/tabs/All_item.dart';
import 'package:foodmenu/view/widgets/tabs/Deserts.dart';
import 'package:foodmenu/view/widgets/tabs/breakfast.dart';
import 'package:foodmenu/view/widgets/tabs/drinks.dart';






class item extends StatefulWidget {
  final String name;
  final String cost;
  final String description;
  final String image;
  const item(
      {Key? key,
      required this.name,
      required this.cost,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  State<item> createState() => _itemState();
}

class _itemState extends State<item> {
  // Future<void> _deleteFood(name) async {
  @override
  Widget build(BuildContext context) {
    //to get show the iteam that saved
    getFood();
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            'Item',
            style: TextStyle(
                color: Color.fromARGB(
                    255, 0, 0, 0)), // Set the text color to white
          ),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'all'),
              Tab(text: 'breakfast'),
              Tab(text: 'desrets'),
              Tab(text: 'bevarge'),
            ],

            labelColor: Color.fromARGB(
                255, 0, 0, 0), // Set the selected tab text color to black
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
              ],
            )
          ],
        ),
        body: TabBarView(
          children: [
            AllItems(),
            const Breakfast(),
            const Desrets(),
            const Bevarge(),
          ],
        ),
      ),
    );
  }
}
