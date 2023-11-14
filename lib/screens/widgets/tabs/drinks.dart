import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';

import 'package:foodmenu/screens/pages/detial.dart';

late final String name;
// Future<void> _deleteFood(name) async {
//   deleteFood(name); // Call the deleteFood function from db_function.dart
// }

// //change alliteam
// Widget Bevarge() {
//   return

//   // ListView.separated(
//   //   itemBuilder: (ctx, index) {
//   //     return ListTile(
//   //       title: Text("name $index"),
//   //       subtitle: Text("age $index"),
//   //     );
//   //   },
//   //   separatorBuilder: (ctx, index) {
//   //     return const Divider();
//   //   },
//   //   itemCount: 10,
//   // );
// }

class Bevarge extends StatefulWidget {
  const Bevarge({super.key});

  @override
  State<Bevarge> createState() => _BevargeState();
}

class _BevargeState extends State<Bevarge> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FoodListNotifier,
      builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
        final filteredBreakfastList = foodList
            .where((food) => food.category?.contains('drinks') == true)
            .toList();

        return ListView.builder(
          itemCount: filteredBreakfastList.length,
          itemBuilder: (context, index) {
            final data = filteredBreakfastList[index];
            // Return a Card widget for each item
            return Slidable(
              startActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Confirm Deletion"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Add your image here at the top center
                                Image.asset(
                                  "assets/Questions-pana.png",
                                  width: 100,
                                  height: 100,
                                ),
                                SizedBox(height: 16), // Add some spacing
                                Text(
                                    "Are you sure you want to delete this product?"),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  deletfood(
                                      index); // Call your delete function here
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      if (isProductInCart(data)) {
                        // Product is already in the cart, show a message
                        final snackBar = SnackBar(
                          content: Text('The product is already in the cart'),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        // Product is not in the cart, add it and show a different message
                        addToCart(data);
                        final snackBar = SnackBar(
                          content: Text('Product added to the cart'),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    backgroundColor: Colors.black54,
                    icon: Icons.shopping_cart,
                  )
                ],
              ),
              child: Card(
                elevation: 3,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detailpage(
                          name: data.name,
                          cost: data.cost,
                          description: data.description,
                          image: data.image,
                          category: data.category,
                          index: index,
                        ),
                      ),
                    );
                  },
                  leading: Container(
                    height: double.infinity,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: data.image != null
                          ? DecorationImage(
                              image: FileImage(File(data.image)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Text(
                            data.category ?? 'default',
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      Text(
                        "\$${data.cost}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 58, 95, 33),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

bool isProductInCart(Food product) {
  return cartitems.any((item) => item.name == product.name);
}
