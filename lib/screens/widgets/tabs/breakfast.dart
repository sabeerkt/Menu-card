import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';

import 'package:foodmenu/screens/pages/detial.dart';

late final String name;
// Future<void> _deleteFood(name) async {
//   deleteFood(name); // Call the deleteFood function from db_function.dart
// }

//change alliteam
// Widget Breakfast() {
//   List<Food> filteredBreakfastList = [];
//   return

// }

class Breakfast extends StatefulWidget {
  const Breakfast({super.key});

  @override
  State<Breakfast> createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
  List<Food> filteredBreakfastList = [];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: FoodListNotifier,
      builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
        final filteredBreakfastList = foodList
            .where((food) => food.category?.contains('breakfast') == true)
            .toList();
        return ListView.builder(
          itemCount: filteredBreakfastList.length,
          itemBuilder: (context, index) {
            final data = filteredBreakfastList[index];
            // Return a Card widget for each item
            return Card(
              elevation:
                  3, // Adjust the elevation value for the desired shadow effect
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
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
                onTap: () {
                  // Navigate to the detail page when the ListTile is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailpage(
                              name: data.name,
                              cost: data.cost,
                              description: data.description,
                              image: data.image,
                              category: data.category
                              
                            )),
                  );
                },
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
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  data.category ?? 'default',
                                  style: TextStyle(color: Colors.blue),
                                )
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
                                      backgroundColor: Colors
                                          .red, // Set the background color
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
                                            width:
                                                100, // Set the width of the image as per your needs
                                            height:
                                                100, // Set the height of the image as per your needs
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
                  style: TextStyle(
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

bool isProductInCart(Food product) {
  return cartitems.any((item) => item.name == product.name);
}
