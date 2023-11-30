import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/model/model.dart';

import 'package:foodmenu/view/detail_screen/detial.dart';

import 'package:lottie/lottie.dart';

late final String name;

class Desrets extends StatefulWidget {
  const Desrets({super.key});

  @override
  State<Desrets> createState() => _DesretsState();
}

class _DesretsState extends State<Desrets> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FoodListNotifier,
      builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
        // foodList = foodList.reversed.toList();
        final filteredBreakfastList = foodList
            .where((food) => food.category?.contains('desserts') == true)
            .toList();
        return ListView.builder(
          itemCount: filteredBreakfastList.length,
          itemBuilder: (context, index) {
            final data = filteredBreakfastList[index];
            // Return a Card widget for each item
            return Slidable(
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm Deletion"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  "assets/Questions-pana.png",
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                    "Are you sure you want to delete this product?"),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  deletfood(index);
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
                        final snackBar = SnackBar(
                          content: Row(
                            children: [
                              const Text('The product is already in the cart'),
                              const SizedBox(width: 10),
                              Lottie.asset(
                                'assets/sad.json', // Replace with the actual image path
                                width: 20, // Adjust the width as needed
                                height: 20, // Adjust the height as needed
                              ),
                            ],
                          ),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        addToCart(data);
                        final snackBar = SnackBar(
                          content: Row(
                            children: [
                              const Text('Product added to the cart'),
                              const SizedBox(width: 10),
                              Lottie.asset(
                                'assets/smile.json', // Replace with the actual image path
                                width: 20, // Adjust the width as needed
                                height: 20, // Adjust the height as needed
                              ),
                            ],
                          ),
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
                        builder: (context) => DetailPage(
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
                      shape: BoxShape.circle,
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
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
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
