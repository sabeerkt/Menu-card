import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:image_picker/image_picker.dart';

import 'package:foodmenu/Components/bottom.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/utility/utilty.dart';

class EditDish extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController costController;
  final TextEditingController descriptionController;
  final TextEditingController imageController;

  final bool isEditMode; // Set to true when editing an existing item
  final int index; // Pass the index if you're editing an existing item

  EditDish({
    required this.nameController,
    required this.costController,
    required this.descriptionController,
    required this.isEditMode,
    required this.index,
    required this.imageController,
  });

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
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
            "Edit Dish",
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

                Container(),
                const SizedBox(
                  height: 10,
                ),
                // TextField for 'Name'
                Column(
                  children: [
                    TextField(
                      controller: widget.nameController,
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
                      controller: widget.costController,
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
                      controller: widget.descriptionController,
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
                  ],
                ),

                // ... Other TextFields for cost and description

                MaterialButton(
                  color: Color.fromARGB(255, 120, 82, 150),
                  onPressed: onnUpdateDishButton,
                  child: GlowText(
                    'Update',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
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

  Future<void> onnUpdateDishButton() async {
    final _name = widget.nameController.text.trim();
    final _cost = widget.costController.text.trim();
    final _Description = widget.descriptionController.text.trim();
    if (_name.isEmpty || _cost.isEmpty) {
      return;
    }

    final _foodd = Food(
      name: _name,
      cost: _cost,
      description: _Description,
      image: pickedImage?.path ?? '',
    );

    if (widget.isEditMode) {
      updateFood(widget.index, _foodd);
    } else {
      addFood(_foodd);
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BottomBar(name: '', cost: '', image: ''),
      ),
    );
  }
}
