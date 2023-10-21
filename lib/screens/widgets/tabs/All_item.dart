import 'package:flutter/material.dart';

import 'package:foodmenu/screens/pages/detial.dart';

//change alliteam
Widget All_iteam() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Return a Card widget for each item
      return Card(
        color: Color.fromARGB(255, 210, 144, 108),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Container(
            height: double.infinity,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/undoaed.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            // Navigate to the detail page when the ListTile is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const detailpage()),
            );
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Chicken",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(), // Add spacer to push the checkbox to the right
                  Checkbox(
                    value: true, // Set the initial value as needed
                    onChanged: (bool? value) {
                      // Handle checkbox state change
                    },
                  ),
                ],
              ),
              Text(
                "Biryani",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          subtitle: Text(
            "RS 900",
            style: TextStyle(color: Color.fromARGB(255, 58, 95, 33)),
          ),
        ),
      );
    },
  );
}
