import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/screens/pages/cart.dart';
import 'package:foodmenu/screens/pages/edit.dart';
import 'package:foodmenu/screens/widgets/search.dart';

class detailpage extends StatefulWidget {
  final String name;
  final String cost;
  final String description;
  final String image;
  final String? category;

  const detailpage({
    Key? key,
    required this.image,
    required this.name,
    required this.cost,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryController = TextEditingController(text: widget.category);

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
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditDish(
                    imageController: TextEditingController(text: widget.image),
                    nameController: TextEditingController(text: widget.name),
                    costController: TextEditingController(text: widget.cost),
                    descriptionController: TextEditingController(text: widget.description),
                    categoryController: categoryController, // Pass the categoryController
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container(
                width: 600,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.image != null
                        ? FileImage(File(widget.image))
                        : const AssetImage("assets/juice.jfif") as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
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
                      widget.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        Text(
                          "\$${widget.cost}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.category!)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(right: 225),
                    child: Text(
                      'description',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
