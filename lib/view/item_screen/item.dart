import 'package:flutter/material.dart';

import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/view/item_screen/widgets/All_item.dart';
import 'package:foodmenu/view/item_screen/widgets/Deserts.dart';
import 'package:foodmenu/view/item_screen/widgets/breakfast.dart';
import 'package:foodmenu/view/item_screen/widgets/drinks.dart';
import 'package:foodmenu/view/sesrch_screen/search.dart';
import 'package:provider/provider.dart';






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
   // getFood();
    void initState() {
    super.initState();
    Provider.of<DbFunctionProvider>(context, listen: false).getFood();
  }
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
