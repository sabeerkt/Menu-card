
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmenu/view/newdish_screen/newdish.dart';
import 'package:foodmenu/view/reset_screen/reset.dart';

import 'package:foodmenu/view/terms_screen/term.dart';
import 'package:lottie/lottie.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Lottie.asset(
            'assets/setting.json',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                                tap(context, item);
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
          ),
        ],
      ),
    );
  }

  void tap(BuildContext context, ItemData item) {
    switch (item.name) {
      case 'Terms and Conditions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Term()),
        );
        break;
      case 'New dish':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewDish()),
        );
        break;
      case 'Exit':
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

// void resetDB(BuildContext context) {
//   // Implement your reset logic here
// }
