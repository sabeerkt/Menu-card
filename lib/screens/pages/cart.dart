import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';

class cart extends StatefulWidget {
  cart({
    Key? key,
  }) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
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
              child: ListView.builder(
                itemCount: cartitems.length,
                itemBuilder: (context, index) {
                  final cartdata = cartitems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        child: ListTile(
                          tileColor: Color.fromARGB(255, 255, 255, 255),
                          leading: Container(
                            height: double.infinity,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: cartdata.image != null
                                  ? DecorationImage(
                                      image: FileImage(File(cartdata.image)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          ),
                          title: Text(
                            cartdata.name,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                onPressed: () {
                                  // Add logic to decrease item count
                                },
                              ),
                              const Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                onPressed: () {
                                  // Add logic to increase item count
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Color.fromARGB(255, 255, 0, 0)),
                                onPressed: () {
                                  setState(() {
                                    deleteCartItem(index);
                                  });
                                },
                              ),
                              Text(
                                '\$${cartdata.cost}',
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
                  );
                },
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
                        '100',
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
