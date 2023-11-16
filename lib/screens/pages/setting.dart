import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmenu/Screens/Pages/newdish.dart';
import 'package:foodmenu/screens/sub_screens/rest.dart';
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
    ItemData(Icons.exit_to_app, 'Exit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
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
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
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
          MaterialPageRoute(builder: (context) => const NewDish()),
        );
        break;
      case 'Exit':
        // Handle exit logic here
        // For example, you can use SystemNavigator.pop to close the app
        // Note: This method may not work on all platforms.
        // For a more robust solution, consider using platform-specific implementations.
        SystemNavigator.pop();
        break;
      case 'Reset App':
        resetDB(context);
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
