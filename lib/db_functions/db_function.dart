import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodmenu/model/model.dart';

import 'package:hive/hive.dart';

const foodtransactionDbName = 'data';

class DbFunctionProvider extends ChangeNotifier {
  List<Food> foodtransactionList = [];
//ValueNotifier<List<Food>> FoodListNotifier = ValueNotifier([]);
  List<Food> cartitems = [];

  Future<void> addFood(Food value) async {
    final Fooddb = await Hive.openBox<Food>(foodtransactionDbName);
    Fooddb.add(value);
    getFood();
    notifyListeners();
  }

  getFood() async {
    final Fooddb = await Hive.openBox<Food>(foodtransactionDbName);
    foodtransactionList.clear();
    foodtransactionList.addAll(Fooddb.values);
    notifyListeners();
  }

  Future<void> updateFood(int index, Food newValue) async {
    final Fooddb = await Hive.openBox<Food>(foodtransactionDbName);
    foodtransactionList.clear();
    foodtransactionList.addAll(Fooddb.values);
    await Fooddb.putAt(index, newValue);

    // print(Fooddb.values);
    getFood();
    // Refresh the list after update
    notifyListeners();
  }

  Future<void> deletfood(int index) async {
    final Fooddb = await Hive.openBox<Food>(foodtransactionDbName);
    await Fooddb.deleteAt(index);
    getFood();
    notifyListeners();
  }

//cart
  Future<void> addToCart(Food data) async {
    final cartdb = await Hive.openBox<Food>(foodtransactionDbName);
    data.count = 1;
    cartitems.add(data);
    cartdb.add(data);
    loadCart();
    notifyListeners();
  }

//load the cart

  loadCart() async {
    final cartdb = await Hive.openBox<Food>(foodtransactionDbName);

    final values = cartdb.values;

    cartitems.clear();
    cartitems = values.toList();
    notifyListeners();
  }

  deleteCartItem(int id) async {
    final cartdb = await Hive.openBox<Food>(foodtransactionDbName);
    cartdb.deleteAt(id);
    cartitems.removeAt(id);
    loadCart();
    notifyListeners();
  }

  void clearCart() async {
    final cartdb = await Hive.openBox<Food>(foodtransactionDbName);
    cartdb.clear();
    cartitems.clear();
    notifyListeners();
  }
//chart calcultion

  double calculateTotalCost(List<Food> foods) {
    double totalCost = 0;
    for (var food in foods) {
      totalCost += double.parse(food.cost);
    }
    return totalCost;
  }

//totaling of the cart prodct
  double calculateTotalCostt() {
    double totalCost = 0;
    for (var food in cartitems) {
      totalCost += double.parse(food.cost) * (food.count ?? 0);
    }
    return totalCost;
  }
}
