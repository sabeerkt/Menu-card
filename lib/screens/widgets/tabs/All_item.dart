import 'package:flutter/material.dart';

import 'package:foodmenu/screens/pages/detial.dart';

//change alliteam
Widget All_iteam() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Return a Card widget for each item
      return Card(
        color: Color.fromARGB(
            255, 210, 144, 108), // Set the background color to black
        child: ListTile(
          contentPadding: const EdgeInsets.all(
              10), // Add some padding for better appearance
          leading: Container(
            height: 60,
            width: 100, // Adjust the width to your preference
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/undoaed.png"), // Add your image path
                fit: BoxFit.cover, // Image fully covers the Container
              ),
            ),
          ),
          onTap: () {
            // Navigate to the detail page when the ListTile is tapped
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const detailpage()));
          },
          title: const Text(
            "Chicken",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          subtitle: const Text(
            "Biryani",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          trailing: const Text(
            "RS 900",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
      );
    },
  );
}
