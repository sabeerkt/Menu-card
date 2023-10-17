import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true, // Center-align the title
        title: const Text(
          "term and condition ",
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
    );
  }
}
