import 'package:flutter/material.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Set the background color to white
          elevation: 0, // Remove the elevation (border)
          centerTitle: true, // Center-align the title
          title: Text(
            "cart",
            style: TextStyle(
              color: Colors.black, // Set the text color
              fontSize: 16, // Set the text size to a smaller value
            ),
          ),
        ),
      ),
    );
  }
}
