import 'package:flutter/material.dart';


import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/view/item_screen/widgets/All_item.dart';
import 'package:foodmenu/view/item_screen/widgets/Deserts.dart';
import 'package:foodmenu/view/item_screen/widgets/breakfast.dart';
import 'package:foodmenu/view/item_screen/widgets/drinks.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<dbfunction>(context, listen: false).loadrecipes();
  }

  // Future<void> _deleteFood(name) async {
  @override
  Widget build(BuildContext context) {
    final itemdbprovider = Provider.of<dbfunction>(context);
    //to get show the iteam that saved
    itemdbprovider.getFood();
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
              Tab(text: 'All'),
              Tab(text: 'Breakfast'),
              Tab(text: 'Desrets'),
              Tab(text: 'Bevarge'),
            ],

            labelColor: Color.fromARGB(
                255, 0, 0, 0), // Set the selected tab text color to black
            unselectedLabelColor: Color.fromARGB(255, 126, 123, 123),
          ),
          actions: [
            Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const Search(),
                //         ));
                //   },
                //   icon: const Icon(Icons.search),
                // ),
              ],
            )
          ],
        ),
        body: TabBarView(
          children: [
            AllItems(context),
            Breakfast(),
            Desrets(),
            Bevarge(),
          ],
        ),
      ),
    );
  }
}
