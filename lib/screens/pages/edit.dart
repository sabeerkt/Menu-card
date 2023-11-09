import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodmenu/Screens/Widgets/bottom.dart';
import 'package:image_picker/image_picker.dart';

class EditDish extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController costController;
  final TextEditingController descriptionController;
  final TextEditingController imageController;
  final TextEditingController categoryController;
  final bool isEditMode;
  final int index;

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
  _EditDishState createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  XFile? pickedImage;
  String selectedCategory = 'breakfast';

  final List<String> _foodCategoryList = ['breakfast', 'desserts', 'drinks'];

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        pickedImage = picked;
        widget.imageController.text = picked.path; // Update the image path in the controller
      });
    }
  }

  @override
  void initState() {
    super.initState();
    pickedImage = widget.imageController.text.isNotEmpty
        ? XFile(widget.imageController.text)
        : null;
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
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
            ),
          ),
          flexibleSpace: Container(
            color: Color.fromARGB(255, 0, 0, 0),
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
                              onPressed: _pickImage,
                              icon: const Icon(Icons.image),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
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
                                    borderSide: BorderSide(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: selectedCategory,
                              items: _foodCategoryList.map((e) {
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
                                return _foodCategoryList.map((e) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 10),
                                      Text(e, style: TextStyle(fontSize: 18)),
                                    ],
                                  );
                                }).toList();
                              },
                              hint: Text(
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
                                  selectedCategory = value!;
                                  widget.categoryController.text = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
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
                      maxLines: 5,
                    ),
                  ],
                ),
                MaterialButton(
                  color: Color.fromARGB(255, 0, 0, 0),
                  onPressed: onUpdateDishButton,
                  child: Text(
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

  Future<void> onUpdateDishButton() async {
    final _name = widget.nameController.text.trim();
    final _cost = widget.costController.text.trim();
    final _description = widget.descriptionController.text.trim();
    final _category = widget.categoryController.text.trim();

    if (_name.isEmpty || _cost.isEmpty) {
      return;
    }

    // Include the image path
    final _imagePath = pickedImage?.path ?? widget.imageController.text;

    // Continue with your data handling logic
    // ...

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const BottomBar(name: '', cost: '', image: ''),
      ),
    );
  }
}
