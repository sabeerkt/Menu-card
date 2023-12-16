import 'package:flutter/material.dart';
import 'package:foodmenu/controller/cart_provider.dart';
import 'package:foodmenu/model/model.dart';

import 'package:foodmenu/widgets/splash.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

Future<void> resetDB(
  BuildContext context,
) async {
  // ignore: use_build_context_synchronously
  bool confirmReset = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Confirm Reset",
          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
        ),
        content: const Text(
          "This will delete this cart. This action is irreversible. Do  you want to continue ?",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ), 
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text(
              "Reset",
              style: TextStyle(color: Color.fromARGB(255, 245, 0, 0)),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );

  if (confirmReset == true) {
    final resetdbprovider = Provider.of<CartProvider>(context);
    final foodmenuDb = await Hive.openBox<Food>('FoodMenu_db');
    foodmenuDb.clear();
  resetdbprovider.  cartitems.clear();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(),
        ));
  }
}
