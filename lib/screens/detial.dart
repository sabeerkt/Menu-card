import 'package:flutter/material.dart';
import 'package:foodmenu/screens/cart.dart';

class detailpage extends StatelessWidget {
  const detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true, // Center-align the title
        title: const Text(
          "details",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 500,
                height: 250,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/SLID2.jpg"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "dish",
                    //     style: TextStyle(
                    //       fontSize: 24,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Product Name", // Main Heading
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "\$99.99", // Price
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .green, // You can change the color as needed
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "This is a sample product description. You can add details about the product here, such as its features and benefits. This container can hold a lot of information about the product.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              //button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to another page or perform the desired action here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cart()));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 450,
                        height: 80,
                        padding: const EdgeInsets.only(
                            top: 15, left: 10, bottom: 10),
                        decoration: BoxDecoration(color: Color(0xFF9775FA)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'add ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 36, 30, 30),
                                fontSize: 17,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
