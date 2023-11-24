import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:foodmenu/Database/Function/db_function.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/Screens/Widgets/bottom.dart';

import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class NewDish extends StatefulWidget {
  const NewDish({Key? key}) : super(key: key);

  @override
  State<NewDish> createState() => _NewDishState();
}

class _NewDishState extends State<NewDish> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String selectedFoodType = 'breakfast';

  final List<String> _foodTypeList = ['breakfast', 'desserts', 'drinks'];

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
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
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
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
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
                              fit: BoxFit.cover,
                            )
                          : Container(),
                      pickedImage == null
                          ? Positioned.fill(
                              child: GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Lottie.asset(
                                      'assets/addimage.json', // Replace with your image asset
                                      width: 68,
                                      height: 68,
                                      // color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
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
                  controller: _costController,
                  decoration: InputDecoration(
                    labelText: 'Cost',
                    labelStyle: const TextStyle(
                      color: Colors.pink,
                    ),
                    prefixText: '\$',
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
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                            controller: _categoryController,
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
                          value: selectedFoodType,
                          items: _foodTypeList.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            );
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return _foodTypeList.map((e) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
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
                            setState(() {
                              selectedFoodType = value!;
                              _categoryController.text = value;
                            });
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
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: onAddDishButton,
                  child: const GlowText(
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
        backgroundColor: Colors.white,
      ),
    );
  }

  Future<void> onAddDishButton() async {
    final _name = _nameController.text.trim();
    final _cost = _costController.text.trim();
    final _description = _descriptionController.text.trim();
    final _category = _categoryController.text.trim();

    if (_name.isEmpty ||
        _cost.isEmpty ||
        _description.isEmpty ||
        _category.isEmpty) {
      return;
    }

    final food = Food(
      name: _name,
      cost: _cost,
      description: _description,
      category: _category,
      image: pickedImage?.path ?? '',
    );

    addFood(food);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const BottomBar(name: '', cost: '', image: ''),
      ),
    );
  }
}
