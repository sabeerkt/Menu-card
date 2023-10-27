import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "search",
          style: TextStyle(
            color: Color.fromARGB(255, 246, 246, 246),
            fontSize: 16,
          ),
        ),
        flexibleSpace: Container(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
              borderSide: const BorderSide(
                color: Colors.orange, // Set the border color
                width: 2.0, // Set the border width
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(
              Icons.search_sharp,
              color: Colors.orange, // Set the icon color to orange
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
              color: Color(0xFF636262), // Set the hint text color
            ),
          ),
        ),
      ),
    );
  }
}
