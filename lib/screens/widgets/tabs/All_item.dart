import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';

import 'package:foodmenu/screens/pages/detial.dart';

// Future<void> _deleteFood(name) async {
//   deleteFood(name); // Call the deleteFood function from db_function.dart
// }

//change alliteam
Widget All_iteam() {
  return ValueListenableBuilder(
    valueListenable: FoodListNotifier,
    builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
      return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final data = foodList[index];
          // Create a custom item widget for each item
          return Card(
            color: Color.fromARGB(255, 255, 255, 255),
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
                              addToCart(data);
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              deletfood(index);
                            },
                            icon: Icon(
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

// class CustomFoodItem extends StatelessWidget {
//   final Food data;

//   CustomFoodItem({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

 // ListView.separated(
  //   itemBuilder: (ctx, index) {
  //     return ListTile(
  //       title: Text("name $index"),
  //       subtitle: Text("age $index"),
  //     );
  //   },
  //   separatorBuilder: (ctx, index) {
  //     return const Divider();
  //   },
  //   itemCount: 10,
  // );