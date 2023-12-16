import 'package:flutter/foundation.dart';
import 'package:foodmenu/model/model.dart';
import 'package:hive/hive.dart';

class CartProvider extends ChangeNotifier {
  List<Food> cartitems = [];

  // Add the updateItemCount method
  void updateItemCount(int index, int newCount) {
    if (index >= 0 && index < cartitems.length) {
      cartitems[index].count = newCount;

      // Update the item in the Hive box
      final cartdb = Hive.box<Food>('cart_db');
      cartdb.putAt(index, cartitems[index]);

      notifyListeners();
    }
  }

  // ... (existing methods)

  Future<void> addToCart(Food data) async {
    final cartdb = await Hive.openBox<Food>('cart_db');
    data.count = 1;
    cartitems.add(data);
    await cartdb.add(data);
    notifyListeners();
  }

  loadCart() async {
    final cartdb = await Hive.openBox<Food>('cart_db');
    final values = cartdb.values.toList();
    cartitems.clear();
    cartitems = values.toList();
    notifyListeners();
    await cartdb.close();
  }

  deleteCartItem(int id) async {
    final cartdb = await Hive.openBox<Food>('cart_db');
    cartdb.deleteAt(id);
    cartitems.removeAt(id);
    loadCart();
    notifyListeners();
  }

  void clearCart() async {
    final cartdb = await Hive.openBox<Food>('cart_db');
    cartdb.clear();
    cartitems.clear();
    notifyListeners();
  }

  double calculateTotalCostt() {
    double totalCost = 0;
    for (var food in cartitems) {
      totalCost += double.parse(food.cost) * (food.count ?? 0);
    }
    return totalCost;
  }

  bool isProductInCart(Food product) {
    return cartitems.any((item) => item.name == product.name);
  }
}
