import 'package:flutter/material.dart';
import 'package:foodmenu/screens/detial.dart';

Widget breakfast() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      // Return a Card widget for each item
      return Card(
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // Add any other styling here
            ),
          ),
          onTap: () {
            // Navigate to the detail page when the ListTile is tapped
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => detailpage()));
          },
          title: Text("dosha"),
          subtitle: Text("breakfast"),
          trailing: Text("100"),
        ),
      );
    },
  );
}
