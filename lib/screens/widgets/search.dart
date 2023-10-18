import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            suffixIcon: Icon(
              Icons.search_sharp,
              color: Colors.orange, // Set the icon color to orange
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Color(0xFF636262), // Set the hint text color
            ),
          ),
        ),
      ),
    );
  }
}
