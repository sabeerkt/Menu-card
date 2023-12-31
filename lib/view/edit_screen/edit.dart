import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/model/model.dart';
import 'package:foodmenu/widgets/bottom.dart';

import 'package:image_picker/image_picker.dart';

import 'package:foodmenu/utility/utilty.dart';
import 'package:provider/provider.dart';

class EditDish extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController costController;
  final TextEditingController descriptionController;
  final TextEditingController imageController;
  final bool isEditMode;
  final int index;
  TextEditingController categoryController = TextEditingController();

  EditDish({
    required this.nameController,
    required this.costController,
    required this.descriptionController,
    required this.isEditMode,
    required this.index,
    required this.imageController,
    required this.categoryController,
  });

  @override
  State<EditDish> createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  String dropdownValue = 'all';
  XFile? pickedImage;
  String selectedCategory = 'breakfast';

  final List<String> _foodCategoryList = ['breakfast', 'desserts', 'drinks'];

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
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
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
                    const SizedBox(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select the category',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: widget.categoryController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            DropdownButton<String>(
                              value: selectedCategory,
                              items: _foodCategoryList.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(e,
                                          style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                );
                              }).toList(),
                              selectedItemBuilder: (BuildContext context) {
                                return _foodCategoryList.map((e) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(e,
                                          style: const TextStyle(fontSize: 18)),
                                    ],
                                  );
                                }).toList();
                              },
                              hint: const Text(
                                'Select',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              underline: Container(),
                              onChanged: (value) {
                              
                                  selectedCategory = value!;
                                  widget.categoryController.text = value;
                              
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
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
                MaterialButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: onnUpdateDishButton,
                  child: const GlowText(
                    'Update',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
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
                 
                    pickedImage = picked;
                  
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.gallery);
              
                    pickedImage = picked;
               
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> onnUpdateDishButton() async {
   // final editdbprovider = Provider.of<dbfunction>(context);
    final _name = widget.nameController.text.trim();
    final _cost = widget.costController.text.trim();
    final _Description = widget.descriptionController.text.trim();

    if (_name.isEmpty || _cost.isEmpty) {
      return;
    }

    final _foodd = Food(
      name: _name,
      cost: _cost,
      category: widget.categoryController.text.trim(),
      description: _Description,
      image: pickedImage?.path ?? '',
    );

   Provider.of<dbfunction>(context, listen: false). updateFood(widget.index, _foodd);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>  const BottomBar( 
          name: '', cost: '', image: '',
        ),
      ),
    );
  }
}
