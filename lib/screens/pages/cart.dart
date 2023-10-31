import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';

class cart extends StatelessWidget {
  final String name;
  final String cost;
  final String image;
  cart({
    Key? key,
    required this.image,
    required this.name,
    required this.cost,
  }) : super(key: key);

  // Future<void> _deleteFood(id) async {
  //   deleteFood(id); // Call the deleteFood function from db_function.dart
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Cart",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          25), // Adjust the radius as needed
                      child: Card(
                        child: ListTile(
                          tileColor: const Color.fromARGB(255, 6, 6, 6),
                          leading: Container(
                            height: double.infinity,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: image != null
                                  ? DecorationImage(
                                      image: FileImage(File(image)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          ),
                          title: Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Colors.white),
                                onPressed: () {
                                  // Add logic to decrease item count
                                },
                              ),
                              const Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                onPressed: () {
                                  // Add logic to increase item count
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.white),
                                onPressed: () {
                                  // _deleteFood(name);
                                  // Navigator.pop(context);
                                  // print("deleted");
                                },
                              ),
                              Text(
                                cost,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF65B31D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //billl
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255), width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Bill",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Discount Cost",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Total Cost",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        cost,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
