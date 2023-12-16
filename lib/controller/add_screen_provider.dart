import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreenProvider extends ChangeNotifier {

  String? selectedFoodType = 'breakfast';

  final List<String> _foodTypeList = ['breakfast', 'desserts', 'drinks'];

  XFile? pickedImage;
  

  void changeselecteditemvalue(String? value) {
   selectedFoodType  = value;
    notifyListeners();
  }


  void resetselecteditems() {
    selectedFoodType = null;
    notifyListeners();
  }

  

  
}