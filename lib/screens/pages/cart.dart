import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';

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
            widget.onDecrease(widget.value);
          },
          icon: const Icon(Icons.remove),
        ),
        Text(
          widget.value.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        IconButton(
          onPressed: () {
            widget.onIncrease(widget.value);
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
  double totalCost = 0; // State variable to store the total cost

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
            totalCost =
                calculateTotalCost(); // Calculate and update the total cost

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
                              elevation:
                                  3, // Adjust the elevation value for the desired shadow effect
                              shadowColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius
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
                                      value: cartitems[index].count,
                                      onIncrease: (count) {
                                        setState(() {
                                          cartitems[index].count++;
                                        });
                                      },
                                      onDecrease: (count) {
                                        if (cartitems[index].count > 1) {
                                          setState(() {
                                            cartitems[index].count--;
                                          });
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color:
                                              Color.fromARGB(255, 255, 0, 0)),
                                      onPressed: () {
                                        _showDeleteConfirmationDialog(index);
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
                      return const SizedBox.shrink();
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
                            '\$${totalCost.toStringAsFixed(2)}',
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
      totalCost += double.parse(food.cost) * food.count;
    }
    return totalCost;
  }

  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Your image goes here
              Image.asset('assets/Questions-pana.png', width: 100, height: 100),
              SizedBox(height: 16), // Add some space between the image and text
              Text('Delete Item', style: TextStyle(fontSize: 18)),
              Text('Are you sure you want to delete this item from your cart?'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                setState(() {
                  deleteCartItem(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
