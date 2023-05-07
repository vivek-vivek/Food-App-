import 'package:flutter/material.dart';

import '../model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> items = [];

  double get totalCost {
    double sum = 0.0;
    for (var item in items) {
      sum += item.price * item.quantity;
    }
    return sum;
  }

  double get payAmount {
    double sum = 0.0;
    for (var item in items) {
      sum += item.price * item.quantity;
    }
    return sum; // adding 50 as a fixed shipping charge
  }

  void add(CartModel item) {
    int index = items.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1) {
      CartModel existingItem = items[index];
      CartModel newItem = CartModel(
        id: existingItem.id,
        name: existingItem.name,
        price: existingItem.price,
        quantity: existingItem.quantity + item.quantity,
        calories: existingItem.calories,
      );
      items[index] = newItem;
      notifyListeners();
    } else {
      items.add(item);
      notifyListeners();
    }
  }

  void remove(CartModel item) {
    int index = items.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
        notifyListeners();
      } else {
        items.removeAt(index);
        notifyListeners();
      }
    }
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }
}
