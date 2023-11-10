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
            const SizedBox(height: 20),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: ValueListenableBuilder(
                valueListenable: FoodListNotifier,
                builder:
                    (BuildContext context, List<Food> value, Widget? child) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: CarouselSlider(
                      items: fooddata.map((food) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 500,
                              child: food.image != null
                                  ? Image.file(
                                      File(food.image),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(), // Handle the case where the image is null
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: MediaQuery.of(context).size.width / 500,
                        viewportFraction: 1.0,
                        initialPage: 0,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
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
                                  const snackBar = SnackBar(
                                    content: Text(
                                        'The product is already in the cart'),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  addToCart(data);
                                  const snackBar = SnackBar(
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
                                      style: const TextStyle(color: Colors.red),
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
