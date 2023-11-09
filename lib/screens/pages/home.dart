import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/Screens/Widgets/Tabs/All_item.dart';
import 'package:foodmenu/screens/pages/detial.dart';

import 'package:foodmenu/screens/pages/item.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imageList = [
    'assets/foodiesfeed.com_red-apple-background.jpg',
    'assets/pexels-spencer-davis-4393021.jpg',
    'assets/q3.JPG',
  ];

  final fooddata = FoodListNotifier.value;

  @override
  Widget build(BuildContext context) {
    getfood();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Container(
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/appbar.jpeg'),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: 30),
                  GlowText(
                    'Satisfy your cravings!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 48, 50, 51),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: CarouselSlider(
                  items: imageList.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: MediaQuery.of(context).size.width / 500,
                    viewportFraction: 2.0,
                    initialPage: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // const Divider(
            //   color: Color.fromARGB(255, 0, 0, 0),
            // ),
            const Text(
              "Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: FoodListNotifier,
              builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: fooddata.length,
                    itemBuilder: (context, index) {
                      final data = fooddata[index];
                      // Create a custom item widget for each item
                      return Card(
                        elevation: 4, // Add elevation for a card-like effect
                        margin: const EdgeInsets.all(
                            10), // Add margin for spacing between cards
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
                                    category: data.category),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        data.name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight
                                                .bold), // Make the title bold
                                      ),
                                      Text(
                                        data.category ?? 'default',
                                        style:
                                            const TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (isProductInCart(data)) {
                                            // Show a snackbar to inform the user that the product is already in the cart
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors
                                                    .red, // Set the background color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Set a curved shape
                                                ),
                                                content: Text(
                                                  'Product is already in the cart',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold, // Make text bold
                                                    color: Colors
                                                        .white, // Change text color
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            // Product is not in the cart, so add it
                                            addToCart(data);

                                            // Show a snackbar when item is added to the cart
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors
                                                    .green, // Set the background color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // Set a curved shape
                                                ),
                                                content: Text(
                                                  'Product added to cart',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold, // Make text bold
                                                    color: Colors
                                                        .white, // Change text color
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'assets/Questions-pana.png', // Replace 'your_image_path' with the path to your image
                                                      width: 100,
                                                      height: 100,
                                                    ),
                                                    Text('Confirm Delete',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        'Are you sure you want to delete this item?'),
                                                    ButtonBar(
                                                      children: <Widget>[
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black26),
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            deletfood(
                                                                index); // Call the delete function
                                                            Navigator.of(
                                                                    context)
                                                                .pop(); // Close the dialog
                                                          },
                                                          child: Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
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
                                  ),
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
                  ),
                );
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
