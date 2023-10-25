import 'package:flutter/material.dart';
import 'package:foodmenu/screens/pages/detial.dart';


Widget bevarge() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Return a Card widget for each item
      return Card(
        color: Colors.black, // Set the background color to black
        child: ListTile(
          contentPadding:
              const EdgeInsets.all(10), // Add some padding for better appearance
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
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => const detailpage()));
          },
          title: const Text(
            "juice",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          subtitle: const Text(
            "lime",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          trailing: const Text(
            "RS 15",
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
      );
    },
  );
}
