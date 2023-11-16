import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/utility/dailogs/cart_dlt_dailog.dart';
import 'package:foodmenu/utility/dailogs/clear_cart_dailog.dart';

import 'package:lottie/lottie.dart';

class QuantityPickerButton extends StatefulWidget {
  final int value;
  final Function(int) onIncrease;
  final Function(int) onDecrease;

  const QuantityPickerButton({
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
    Key? key,
  }) : super(key: key);

  @override
  State<QuantityPickerButton> createState() => _QuantityPickerButtonState();
}

class _QuantityPickerButtonState extends State<QuantityPickerButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.onDecrease(widget.value ?? 0);
          },
          icon: const Icon(Icons.remove),
        ),
        Text(
          (widget.value ?? 0).toString(),
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            widget.onIncrease(widget.value ?? 0);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class Cart extends StatefulWidget {
  Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalCost = 0;

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
            totalCost = calculateTotalCostt();
            if (cartitems.isEmpty) {
              return Center(
                child: Lottie.asset("assets/Animation - 1699951428728.json"),
              );
            }

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
                              elevation: 3,
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
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
                                    QuantityPickerButton(
                                      value: cartitems[index].count ?? 0,
                                      onIncrease: (count) {
                                        setState(() {
                                          cartitems[index].count =
                                              (cartitems[index].count ?? 0) + 1;
                                        });
                                      },
                                      onDecrease: (count) {
                                        if ((cartitems[index].count ?? 0) > 1) {
                                          setState(() {
                                            cartitems[index].count =
                                                (cartitems[index].count ?? 0) -
                                                    1;
                                          });
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color:
                                              Color.fromARGB(255, 255, 0, 0)),
                                      onPressed: () {
                                        showDeleteConfirmationDialog(
                                            index, context);
                                      },
                                    ),
                                    Text(
                                      '\$${cost * (cartitems[index].count ?? 0)}',
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
                      const Column(
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Total Cost",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\$${totalCost.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white, // Set background color to white
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showClearCartConfirmationDialog(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white, // Set button background color to white
                      onPrimary: Colors.red, // Set button text color to red
                    ),
                    child: const Text('Clear Cart'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
