import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';

import 'package:foodmenu/screens/pages/detial.dart';

//change alliteam
Widget All_iteam() {
  return ValueListenableBuilder(
    valueListenable: FoodListNotifier,
    builder: (BuildContext ctx, List<Food> foodList, Widget? child) {
      return ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final data = foodList[index];
          // Return a Card widget for each item
          return Card(
            color: const Color.fromARGB(255, 210, 144, 108),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Container(
                height: double.infinity,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: data.image != null
                      ? DecorationImage(
                          image: FileImage(File(data.image!)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              onTap: () {
                // Navigate to the detail page when the ListTile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailpage(
                            Name: data.name,
                            cost: data.cost,
                          )),
                );
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        data.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(), // Add spacer to push the checkbox to the right
                      Checkbox(
                        value: true, // Set the initial value as needed
                        onChanged: (bool? value) {
                          // Handle checkbox state change
                        },
                      ),
                    ],
                  ),
                  const Text(
                    "Biryani",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              subtitle: Text(
                data.cost,
                style: TextStyle(color: Color.fromARGB(255, 58, 95, 33)),
              ),
            ),
          );
        },
      );
    },
  );

  // ListView.separated(
  //   itemBuilder: (ctx, index) {
  //     return ListTile(
  //       title: Text("name $index"),
  //       subtitle: Text("age $index"),
  //     );
  //   },
  //   separatorBuilder: (ctx, index) {
  //     return const Divider();
  //   },
  //   itemCount: 10,
  // );
}
