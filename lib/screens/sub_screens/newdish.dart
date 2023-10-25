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

class NewDish extends StatefulWidget {
  const NewDish({Key? key}) : super(key: key);

  @override
  State<NewDish> createState() => _NewDishState();
}

class _NewDishState extends State<NewDish> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String dropdownValue = 'all';
  XFile? pickedImage;

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
            "New Dish",
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      width: 8,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
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
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.pink,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _costController,
                  decoration: InputDecoration(
                    labelText: 'Cost',
                    labelStyle: const TextStyle(
                      color: Colors.pink,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: const TextStyle(
                      color: Colors.pink,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 120, 82, 150),
                  onPressed: onnAddDishButton,
                  child: GlowText(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
    final _name = _nameController.text.trim();
    final _cost = _costController.text.trim();
    final _Description = _descriptionController.text.trim();
    if (_name.isEmpty || _cost.isEmpty) {
      return;
    }

    final foodd = Food(
      name: _name,
      cost: _cost,
      description: _Description,
      image: pickedImage?.path ?? '',
    );

    addFood(foodd);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BottomBar(name: '', cost: '', image: ''),
      ),
    );
  }
}
