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
          centerTitle: true, // Center-align the title
          title: const Text(
            "add dish",
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 65,
                ),
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
                      TextField(
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      SizedBox(
                          height:
                              16.0), // Add vertical spacing between the text fields
                      TextField(
                        decoration: InputDecoration(labelText: 'Cost'),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Category',
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(labelText: 'Description'),
                        maxLines: 3, // Allowing multiple lines for description
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // onTap: () {
                    //   // Navigate to another page or perform the desired action here
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => cart()));
                    // },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => item(),
                                  ));
                            },
                            child: Text("add"))
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
