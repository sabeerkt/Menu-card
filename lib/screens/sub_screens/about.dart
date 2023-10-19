import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF043D5E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "About",
          style: TextStyle(
            color: Colors.white, // Set the text color to white
            fontSize: 16, // Set the text size to 16
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "A food book app developed using Flutter and Hive is a mobile application designed to help users explore the food in the restaurant.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                text: "APP FEATURES",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "⦁ OWNER can edit or delete their saved recipe",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Text(
              "⦁ OWNER can add the new recipe",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const Text(
              "⦁ Search feature available so the user can search their recipe from the stored list as their needs",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
