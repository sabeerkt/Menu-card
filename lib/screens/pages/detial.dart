import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/screens/pages/cart.dart';
import 'package:foodmenu/screens/pages/edit.dart';
import 'package:foodmenu/screens/widgets/search.dart';

class detailpage extends StatelessWidget {
  final String name;
  final String cost;
  final String description;
  final String image;

  const detailpage({
    Key? key,
    required this.image,
    required this.name,
    required this.cost,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
          ),
        ),
        flexibleSpace: Container(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditDish(
                    imageController: TextEditingController(text: image),
                    nameController: TextEditingController(text: name),
                    costController: TextEditingController(text: cost),
                    descriptionController:
                        TextEditingController(text: description),
                    isEditMode: true,
                    index: 0, // You need to provide the correct index
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
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
                  image: DecorationImage(
                    image: image != null
                        ? FileImage(File(image))
                        : AssetImage("assets/juice.jfif") as ImageProvider,
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
                    //       fontWeight: FontWeight bold,
                    //     ),
                    //   ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name, // Main Heading
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "\$$cost", // Price
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description, // Description
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to another page or perform the desired action here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cart(
                                name: name,
                                cost: cost,
                                image: image,
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 230,
                      ),
                      Container(
                        width: double.infinity, // Full width of the screen
                        height: 70, // Height of 70
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => cart(
                                  name: name,
                                  cost: cost,
                                  image: image,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: const Text("Add to Cart"),
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
