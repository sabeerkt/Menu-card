import 'package:flutter/material.dart';

import 'package:foodmenu/screens/sub_screens/about.dart';
import 'package:foodmenu/screens/sub_screens/newdish.dart';
import 'package:foodmenu/screens/sub_screens/term.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<ItemData> itemsList = [
    ItemData(Icons.notes, 'Terms and Conditions'),
    ItemData(Icons.food_bank_outlined, 'New dish'),
    ItemData(Icons.restore, 'Reset App'),
    ItemData(Icons.info, 'About'),
    ItemData(Icons.exit_to_app, 'Exit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 44, 226),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.separated(
            itemCount: itemsList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              final ItemData item = itemsList[index];
              return Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          item.icon,
                          color: Colors.black,
                        ),
                        title: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () {
                          tap(item);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void tap(ItemData item) {
    switch (item.name) {
      case 'Terms and Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const term()),
        );
        break;
      case 'New dish':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => newdish()),
        );
        break;
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const about()),
        );
        break;
      case 'Exit':
        // Handle exit logic here
        break;
      case 'Reset App':
        // Handle reset app logic here
        break;
      default:
        break;
    }
  }
}

class ItemData {
  final IconData icon;
  final String name;

  ItemData(this.icon, this.name);
}
