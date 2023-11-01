import 'package:flutter/foundation.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Food>> FoodListNotifier = ValueNotifier([]);
List<Food> cartitems = [];

Future<void> addFood(Food value) async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  Fooddb.add(value);
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

Future<void> updateFood(int index, Food newValue) async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  await Fooddb.putAt(index, newValue);
  getfood(); // Refresh the list after update
}

Future<void> deletfood(int index) async {
  final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
  await Fooddb.deleteAt(index);
  getfood();
}

addToCart(Food data) async {
  final cartdb = await Hive.openBox<Food>('cart_db');
  cartitems.add(data);
  cartdb.add(data);
}

loadCart() async {
  final cartdb = await Hive.openBox<Food>('cart_db');

  if (cartdb == null) {
    print("cartdb is null");
    return;
  }

  final values = cartdb.values;

  if (values == null) {
    print("cartdb.values is null");
    return;
  }

  cartitems.clear();
  cartitems = values.toList();
}

deleteCartItem(int id) async {
  final cartdb = await Hive.openBox<Food>('cart_db');
  cartdb.deleteAt(id);
  cartitems.removeAt(id);
  loadCart();
}
