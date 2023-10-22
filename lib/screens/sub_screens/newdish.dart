import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';

class newdish extends StatefulWidget {
  const newdish({super.key});

  @override
  State<newdish> createState() => _newdishState();
}

class _newdishState extends State<newdish> {
  List<String> options = <String>['all', 'biryani', 'drinks', 'desrts'];
  String dropdownValue = 'One';
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
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    underline: const SizedBox(),
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                    selectedItemBuilder: (BuildContext context) {
                      return options.map((String value) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dropdownValue,
                          ),
                        );
                      }).toList();
                    },
                    items:
                        options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Category',
                //     labelStyle: const TextStyle(
                //         color: Colors
                //             .pink), // Change label (hint text) color to pink
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(
                //           10.0), // Set border radius to make it curved
                //       borderSide: const BorderSide(
                //           color: Color.fromARGB(
                //               255, 11, 11, 11)), // Set border color to pink
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(
                //           10.0), // Set focused border radius to make it curved
                //       borderSide: const BorderSide(
                //           color:
                //               Colors.pink), // Set focused border color to pink
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Cost',
                    labelStyle: TextStyle(color: Colors.pink),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 11, 11, 11)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                    // This formatter allows only digits (0-9) and prevents other characters
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      // Add a dollar symbol to the input
                      if (newValue.text.isNotEmpty) {
                        return TextEditingValue(
                          text: '\$${newValue.text}',
                          selection: TextSelection.fromPosition(
                            TextPosition(offset: newValue.text.length + 10),
                          ),
                        );
                      }
                      return newValue;
                    }),
                  ],
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
                // TextField(
                //   controller: TextEditingController(),
                //   decoration: InputDecoration(
                //       labelText: 'Label Textfield',
                //       labelStyle: TextStyle(color: Colors.white),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white))),
                // ),
                const SizedBox(height: 16),
                MaterialButton(
                  color: Color.fromARGB(255, 120, 82, 150),
                  onPressed: () {},
                  child: GlowText(
                    'save',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
