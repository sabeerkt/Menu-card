import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/view/edit_screen/edit.dart';




class DetailPage extends StatelessWidget {
  final int index;
  final String name;
  final String cost;
  final String description;
  final String image;
  final String? category;

  DetailPage({
    Key? key,
    required this.index,
    required this.image,
    required this.name,
    required this.cost,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController categoryController =
        TextEditingController(text: category);

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
                    imageController: TextEditingController(text: image),
                    nameController: TextEditingController(text: name),
                    costController: TextEditingController(text: cost),
                    descriptionController:
                        TextEditingController(text: description),
                    categoryController: categoryController,
                    isEditMode: true,
                    index: index,
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
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image != null
                        ? FileImage(File(image))
                        : const AssetImage("assets/juice.jfif")
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow("Name:", name),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBox("Category:", category!),
                      _buildInfoBox("Cost:", '\$$cost',
                          color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
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

  Widget _buildInfoRow(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Set the color for the label (e.g., blue)
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(
                  255, 0, 0, 0), // Set the color for the value (e.g., green)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String label, String value, {Color? color}) {
    return Container(
      width: 150, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
