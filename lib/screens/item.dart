import 'package:flutter/material.dart';
import 'package:foodmenu/screens/widgets/search.dart';
import 'package:foodmenu/screens/widgets/tabs/all.dart';
import 'package:foodmenu/screens/widgets/tabs/bevarge.dart';
import 'package:foodmenu/screens/widgets/tabs/breakfast.dart';
import 'package:foodmenu/screens/widgets/tabs/desrt.dart';

class item extends StatelessWidget {
  const item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF043D5E),
          title: Text(
            'item',
            style: TextStyle(
                color: const Color.fromARGB(
                    255, 255, 255, 255)), // Set the text color to white
          ),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'all'),
              Tab(text: 'breakfast'),
              Tab(text: 'desserts'),
              Tab(text: 'beverage'),
            ],

            labelColor: const Color.fromARGB(
                255, 255, 255, 255), // Set the selected tab text color to black
            unselectedLabelColor: Color.fromARGB(255, 126, 123, 123),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ));
                },
                icon: Icon(Icons.search))
          ],
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
