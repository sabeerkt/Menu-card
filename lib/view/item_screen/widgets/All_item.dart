import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodmenu/controller/cart_provider.dart';

import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/view/detail_screen/detial.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Widget AllItems(context) {
  //TextEditingController _textFieldController = TextEditingController();
  // final load = Provider.of<dbfunction>(context).loadrecipes;
  return Consumer2<dbfunction, CartProvider>(
    builder: (context, value, cartvalue, child) => Column(
      children: [
        // TextField for testing purposes
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (value) =>
                Provider.of<dbfunction>(context, listen: false)
                    .filterRecipes(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintText: 'Search your item',
            ),
          ),
        ),
        // ListView.builder for displaying items
        Expanded(
          child: ListView.builder(
            itemCount: value.foundrecipe.length,
            itemBuilder: (context, index) {
              final reversedIndex = value.foundrecipe.length - 1 - index;
              final data = value.foundrecipe[reversedIndex];

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
                                    value.deletfood(reversedIndex);
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
                        if (cartvalue.isProductInCart(data)) {
                          final snackBar = SnackBar(
                            content: Row(
                              children: [
                                const Text(
                                    'The product is already in the cart'),
                                const SizedBox(width: 10),
                                Lottie.asset(
                                  'assets/sad.json',
                                  width: 20,
                                  height: 20,
                                ),
                              ],
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          cartvalue.addToCart(data);
                          final snackBar = SnackBar(
                            content: Row(
                              children: [
                                const Text('Product added to the cart'),
                                const SizedBox(width: 10),
                                Lottie.asset(
                                  'assets/smile.json',
                                  width: 20,
                                  height: 20,
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
                    ),
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
          ),
        ),
      ],
    ),
  );
}
