import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                                          SizedBox(
                                              height: 16), // Add some spacing
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
                                    content: Text(
                                        'The product is already in the cart'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  // Product is not in the cart, add it and show a different message
                                  addToCart(data);
                                  final snackBar = SnackBar(
                                    content: Text('Product added to the cart'),
                                    backgroundColor: Colors.green,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
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
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      data.category ?? 'default',
                                      style:
                                          const TextStyle(color: Colors.blue),
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
