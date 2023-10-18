import 'package:flutter/material.dart';
import 'package:foodmenu/screens/cart.dart';

import 'package:foodmenu/screens/item.dart';

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
          centerTitle: true,
          title: const Text(
            "new dish",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: const Color(0xFF043D5E),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150, // Adjust the width and height as needed
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 2.0), // Customize border properties
                      ),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: AssetImage(
                            'assets/juice.jfif'), // Provide the image path
                      ),
                    )),
                Positioned(
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
                  bottom: 10,
                  left: 80,
                ),
                Container(
                  padding:
                      const EdgeInsets.all(16.0), // Add padding for spacing

                  child: const Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                      ),
                      SizedBox(
                          height:
                              16.0), // Add vertical spacing between the text fields
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Cost'),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Category',
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Description'),
                          maxLines:
                              3, // Allowing multiple lines for description
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // onTap: () {
                    //     // Navigate to another page or perform the desired action here
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => cart()));
                    // },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity, // Full width of the screen
                          height: 70, // Height of 70
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => cart(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF043D5E), // Dark blue color
                            ),
                            child: Text("submit"),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
