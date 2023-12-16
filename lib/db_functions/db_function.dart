import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:foodmenu/model/model.dart';

class dbfunction extends ChangeNotifier {
  List<Food> fooddata = [];
  List<Food> foundrecipe = [];

  Future<void> addFood(Food value) async {
    final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
    Fooddb.add(value);
    fooddata.add(value);
    notifyListeners();
  }

  Future<void> getFood() async {
    final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
    fooddata.clear();
    fooddata.addAll(Fooddb.values);
    notifyListeners();
  }

  Future<void> updateFood(int index, Food newValue) async {
    final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
    await Fooddb.putAt(index, newValue);
    await getFood(); // Refresh the list after update
    notifyListeners();
  }

  Future<void> deletfood(int index) async {
    final Fooddb = await Hive.openBox<Food>('FoodMenu_db');
    await Fooddb.deleteAt(index);
    await getFood();
    notifyListeners();
  }

  double calculateTotalCost(List<Food> foods) {
    double totalCost = 0;
    for (var food in foods) {
      totalCost += double.parse(food.cost);
    }
    return totalCost;
  }

  loadrecipes() {
    final allrecipes = fooddata;
    foundrecipe = allrecipes;
    notifyListeners();
  }

  filterRecipes(String searchterm) {
    if (searchterm.isEmpty) {
      foundrecipe = fooddata;
      notifyListeners();
    } else {
      foundrecipe = fooddata
          .where((Food recipe) =>
              recipe.name.toLowerCase().contains(searchterm.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
