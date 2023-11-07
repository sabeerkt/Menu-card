import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/screens/pages/detial.dart';

Widget AllItems() {
  List<Food> filteredBreakfastList = [];
  return ValueListenableBuilder(
    valueListenable: FoodListNotifier,
    builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
      return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final data = foodList[index];
          // Create a custom item widget for each item
          return Card(
            elevation: 3, // Add elevation for the shadow effect
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
                      image: data.image, category: data.category
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
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (isProductInCart(data)) {
                                // Show a snackbar to inform the user that the product is already in the cart
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Colors.red, // Set the background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // Set a curved shape
                                    ),
                                    content: Text(
                                      'Product is already in the cart',
                                      style: TextStyle(
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color:
                                            Colors.white, // Change text color
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // Product is not in the cart, so add it
                                addToCart(data);

                                // Show a snackbar when the item is added to the cart
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
                              }
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/Questions-pana.png', // Replace 'your_image_path' with the path to your image
                                          width: 100,
                                          height: 100,
                                        ),
                                        Text('Confirm Delete',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            'Are you sure you want to delete this item?'),
                                        ButtonBar(
                                          children: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deletfood(
                                                    index); // Call the delete function
                                                Navigator.of(context)
                                                    .pop(); // Close the dialog
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
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

bool isProductInCart(Food product) {
  return cartitems.any((item) => item.name == product.name);
}
