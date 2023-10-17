import 'package:flutter/material.dart';

class newdish extends StatefulWidget {
  const newdish({super.key});

  @override
  State<newdish> createState() => _newdishState();
}

class _newdishState extends State<newdish> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true, // Center-align the title
          title: const Text(
            "add dish",
            style: TextStyle(
              color: Colors.black, // Set the text color to black
              fontSize: 16, // Set the text size to 16
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
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
        body: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 65,
              ),
              Positioned(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                bottom: 10,
                left: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
