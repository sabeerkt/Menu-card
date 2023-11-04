import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/screens/pages/detial.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FoodListNotifier,
      builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
        return ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            final data = foodList[index];
            // Create a custom item widget for each item
            return Card(
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  addToCart(data);
                                });
                                // Show a snackbar when item is added to the cart
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors
                                        .green, // Set the background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Set a curved shape
                                    ),
                                    content: Text(
                                      'Product added to cart',
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color:
                                            Colors.white, // Change text color
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                deletfood(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                subtitle: Text(
                  "\$${data.cost}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 58, 95, 33),
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
