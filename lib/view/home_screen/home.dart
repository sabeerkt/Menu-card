import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/model/model.dart';
import 'package:foodmenu/view/detail_screen/detial.dart';
import 'package:foodmenu/view/item_screen/widgets/All_item.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fooddata = 

  @override
  Widget build(BuildContext context) {
    final dbprovider=Provider.of<DbFunctionProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
        body: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ValueListenableBuilder(
                valueListena,
                builder:
                    (BuildContext context, List<Food> value, Widget? child) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
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
                                  : Container(),
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
           
                 Expanded(
                  child: (Provider.of<DbFunctionProvider>(context)
                .foodtransactionList
                .isEmpty)?const Padding(
                padding: EdgeInsets.only(left: 95, top: 500),
                child: Text(
                  'No transactions available',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )  
                : ListView.builder(
                    itemCount:Provider.of<DbFunctionProvider>(context)
                                .foodtransactionList
                                .length, 
                    itemBuilder: (context, index) {
                       final data = Provider.of<DbFunctionProvider>(context)
                          .foodtransactionList
                          .reversed
                          .toList()[index];


                      // final reversedIndex = fooddata.length - 1 - index;
                      // final data = fooddata[reversedIndex];
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
                                            deletfood(reversedIndex);
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
                                        const Text(
                                            'The product is already in the cart'),
                                        const SizedBox(width: 10),
                                        Lottie.asset(
                                          'assets/sad.json', // Replace with the actual image path
                                          width:
                                              20, // Adjust the width as needed
                                          height:
                                              20, // Adjust the height as needed
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  addToCart(data);
                                  final snackBar = SnackBar(
                                    content: Row(
                                      children: [
                                        const Text('Product added to the cart'),
                                        const SizedBox(width: 10),
                                        Lottie.asset(
                                          'assets/smile.json', // Replace with the actual image path
                                          width:
                                              20, // Adjust the width as needed
                                          height:
                                              20, // Adjust the height as needed
                                        ),
                                      ],
                                    ),
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
                                  builder: (context) => DetailPage(
                                    name: data.name,
                                    cost: data.cost,
                                    description: data.description,
                                    image: data.image,
                                    category: data.category,
                                    index: reversedIndex,
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15),
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
