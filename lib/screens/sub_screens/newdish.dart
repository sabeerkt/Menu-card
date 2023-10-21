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
          centerTitle: true,
          title: const Text(
            "new dish",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: const Color.fromARGB(255, 129, 44, 226),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  height: 150.0,
                  color: const Color.fromARGB(255, 255, 255,
                      254), // Use the Colors.orange constant for the orange color
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons
                            .image, // You can change this to the desired image icon
                        color: Color.fromARGB(255, 0, 0, 0), // Icon color
                      ),
                      SizedBox(
                          width:
                              8.0), // Add some spacing between the icon and text
                      Text(
                        "Add Image",
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                    ],
                  ),
                ),
                Container(),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                        color: Colors
                            .pink), // Change label (hint text) color to pink
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set border radius to make it curved
                      borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 11, 11, 11)), // Set border color to pink
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set focused border radius to make it curved
                      borderSide: const BorderSide(
                          color:
                              Colors.pink), // Set focused border color to pink
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: const TextStyle(
                        color: Colors
                            .pink), // Change label (hint text) color to pink
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set border radius to make it curved
                      borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 11, 11, 11)), // Set border color to pink
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set focused border radius to make it curved
                      borderSide: const BorderSide(
                          color:
                              Colors.pink), // Set focused border color to pink
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Cost',
                    labelStyle: const TextStyle(
                        color: Colors
                            .pink), // Change label (hint text) color to pink
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set border radius to make it curved
                      borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 11, 11, 11)), // Set border color to pink
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set focused border radius to make it curved
                      borderSide: const BorderSide(
                          color:
                              Colors.pink), // Set focused border color to pink
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: const TextStyle(
                        color: Colors
                            .pink), // Change label (hint text) color to pink
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set border radius to make it curved
                      borderSide: const BorderSide(
                          color: Color.fromARGB(
                              255, 11, 11, 11)), // Set border color to pink
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set focused border radius to make it curved
                      borderSide: const BorderSide(
                          color:
                              Colors.pink), // Set focused border color to pink
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  color: Color.fromARGB(255, 120, 82, 150),
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
