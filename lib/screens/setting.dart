import 'package:flutter/material.dart';
import 'package:foodmenu/screens/about.dart';
import 'package:foodmenu/screens/newdish.dart';
import 'package:foodmenu/screens/term.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<ItemData> itemsList = [
    ItemData(Icons.notes, 'Terms and Conditions'),
    ItemData(Icons.food_bank_outlined, ' New  dish'),
    ItemData(Icons.restore, 'Reset App'),
    ItemData(Icons.info, ' about '),
    ItemData(Icons.exit_to_app, 'Exit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true, // Center-align the title
        title: const Text(
          "setting",
          style: TextStyle(
            color: Colors.black, // Set the text color to black
            fontSize: 16, // Set the text size to 16
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 178, 171, 171),
                Color(0xFF043D5E),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
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
              final ItemData pages = itemsList[index];
              return Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          pages.icon,
                          color: Colors.black,
                        ),
                        title: Text(
                          pages.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () {
                          Tap(pages);
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

  // ignore: non_constant_identifier_names
  void Tap(ItemData pages) {
    switch (pages.name) {
      case 'Terms and Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const term()),
        );
        break; // Add 'break' to exit the switch statement
      case 'New  dish':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const newdish()),
        );
        break; // Add 'break' to exit the switch statement
      case 'about':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const about()),
        );
        break; // Add 'break' to exit the switch statement
      case 'Exit':
      // exitDB(context);
      case 'Reset App':
        //  resetDB(context);
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
