// Alert box when deleting the cart product
  import 'package:flutter/material.dart';
import 'package:foodmenu/db_functions/db_function.dart';


Future<void> showDeleteConfirmationDialog(int index , BuildContext ctx ) async {
    return showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/Questions-pana.png', width: 100, height: 100),
              const SizedBox(height: 16),
              const Text('Delete Item', style: TextStyle(fontSize: 18)),
              const Text(
                  'Are you sure you want to delete this item from your cart?'),
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
                deleteCartItem(index);
                FoodListNotifier.value = [];
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }