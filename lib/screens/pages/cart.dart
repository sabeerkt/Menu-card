import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';

class Cart extends StatefulWidget {
  Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List<int> counts = List.filled(cartitems.length, 1);

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
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: FoodListNotifier,
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartitems.length,
                    itemBuilder: (context, index) {
                      if (index < cartitems.length) {
                        final cartdata = cartitems[index];
                        int cost = int.tryParse(cartdata.cost) ?? 0;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Card(
                              child: ListTile(
                                tileColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                leading: Container(
                                  height: double.infinity,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: cartdata.image != null
                                        ? DecorationImage(
                                            image:
                                                FileImage(File(cartdata.image)),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                ),
                                title: Text(
                                  cartdata.name,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      onPressed: () {
                                        setState(() {
                                          if (cartitems[index].count > 1) {
                                            cartitems[index].count--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      '${cartitems[index].count}',
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
                                        setState(() {
                                              cartitems[index].count++;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color:
                                              Color.fromARGB(255, 255, 0, 0)),
                                      onPressed: () {
                                        // _showDeleteConfirmationDialog(index);
                                        setState(() {
                                          deleteCartItem(index);
                                        });
                                      },
                                    ),
                                    Text(
                                    '\$${cost * cartitems[index].count}',
                                      style: const TextStyle(
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
                      }
                      return const SizedBox
                          .shrink(); // Handle index out of bounds.
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 255, 255),
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
                            '\$${calculateTotalCost()}',
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
            );
          },
        ),
      ),
    );
  }

  double calculateTotalCost() {
    double totalCost = 0;
    for (var food in cartitems) {
      totalCost += double.parse(food.cost);
    }
    return totalCost;
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    // Your dialog implementation here
  }
}