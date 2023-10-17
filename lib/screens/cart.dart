import 'package:flutter/material.dart';
import 'package:foodmenu/screens/widgets/cartprodt.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true, // Center-align the title
          title: const Text(
            "cart",
            style: TextStyle(
              color: Colors.black, // Set the text color to black
              fontSize: 16, // Set the text size to 16
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 178, 171, 171),
                  Color(0xFF043D5E),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                cartprodt(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 650, 0, 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black,
                  height: 100, // Set the desired height
                  width: double
                      .infinity, // This will make the container take the full width
                  child: Column(
                    children: [
                      // Product name
                      Text(
                        "Product Name",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),

                      // Total
                      Text(
                        "Total: \$100",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),

                      // Subtotal
                      Text(
                        "Subtotal: \$90",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
