import 'package:flutter/material.dart';
import 'package:foodmenu/db_functions/db_function.dart';


Future<void> showClearCartConfirmationDialog(BuildContext ctx) async {
  return showDialog<void>(
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.warning,
                color: Colors.orange, size: 50), // Add caution icon
            SizedBox(height: 16),
            Text('Clear Cart', style: TextStyle(fontSize: 18)),
            Text('Are you sure you want to clear your entire cart?'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              clearCart();
              FoodListNotifier.value = [];

              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}