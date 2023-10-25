import 'package:flutter/foundation.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Food>> FoodListNotifier = ValueNotifier([]);

Future<void> addFood(Food value) async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  final _id = await Fooddb.add(value);

  FoodListNotifier.value.add(value);

  FoodListNotifier.notifyListeners();
  // print(value.toString());
}

Future<void> getfood() async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  FoodListNotifier.value.clear();
  FoodListNotifier.value.addAll(Fooddb.values);
  FoodListNotifier.notifyListeners();
}

// void deleteFood(id) async {
//   final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
//   await Fooddb.deleteAt(id);
//   getfood(); // Refresh the list after deletion
// }

Future<void> deletfood(int index) async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  await Fooddb.deleteAt(index);
  getfood();
}
