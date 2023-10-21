import 'package:flutter/material.dart';
import 'package:foodmenu/screens/detial.dart';

Widget Cart_prodt() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Replace the Card with a Container for custom styling
      return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.black, // Set the background color to black
        child: ListTile(
          contentPadding: const EdgeInsets.all(
              10), // Add some padding for better appearance
          leading: Container(
            height: 60,
            width: 100, // Adjust the width to your preference
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/SLID1.jpg"), // Add your image path
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add), // Icon for increasing quantity
                color: Colors.white,
                onPressed: () {
                  // Increase the quantity of the product
                  // Implement your logic here
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete), // Icon for deleting the item
                color: Colors.white,
                onPressed: () {
                  // Delete the product item
                  // Implement your logic here
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
