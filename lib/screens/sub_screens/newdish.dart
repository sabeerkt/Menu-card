import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:foodmenu/Components/bottom.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/screens/pages/item.dart';
import 'package:foodmenu/utility/utilty.dart';
import 'package:image_picker/image_picker.dart';

class newdish extends StatefulWidget {
  const newdish({super.key});

  @override
  State<newdish> createState() => _newdishState();
}

class _newdishState extends State<newdish> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _costcontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();

  String dropdownValue = 'all';
  XFile? pickedImage;
  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Image
        return AlertDialog(
          title: const Text('Pick Image From...'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.camera);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.gallery);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

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
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                        width: 8,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  child: Stack(
                    children: [
                      pickedImage != null
                          ? Image.file(
                              File(pickedImage!.path),
                              width: 100,
                              height: 100,
                            )
                          : Container(),
                      pickedImage == null
                          ? IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.camera),
                              iconSize: 68,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                
                Container(),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _namecontroller,
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
                
                DropdownButton<String>(
                  items: ['breakfast', 'desrts', 'juice'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                  value: null,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _costcontroller,
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
                  controller: _descriptioncontroller,
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
                  onPressed: () {
                    onnAddDishButton();
                  },
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

  Future<void> onnAddDishButton() async {
    final _name = _namecontroller.text.trim();
    final _cost = _costcontroller.text.trim();
    final _Description = _descriptioncontroller.text.trim();
    if (_name.isEmpty || _cost.isEmpty) {
      return;
    }
    print('$_name $_cost  $_Description');
    final _foodd = Food(
      name: _name,
      cost: _cost,
      description: _Description,
    );
    addFood(_foodd);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => BottomBar()));
  }
}
