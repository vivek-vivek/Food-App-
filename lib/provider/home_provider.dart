import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;

  List<dynamic> apiResponse = [];
  List<dynamic> tableMenuList = [];
  List<dynamic> categoryDishes = [];
  //
  List<dynamic> dishName = [];
  List<dynamic> dishPrice = [];
  List<dynamic> dishCalories = [];
  List<dynamic> dishDescription = [];
  List<dynamic> addonCat = [];
  List<dynamic> dishImage = [];
  List<dynamic> dishId = [];

// Loading state

  void setLoading(bool state) {
    isLoading = state;
    notifyListeners();
  }

  void addResponse(response) {
    // clear list to remove duplication
    apiResponse.clear();
    tableMenuList.clear();
    categoryDishes.clear();
    dishName.clear();
    dishPrice.clear();
    dishCalories.clear();
    dishDescription.clear();
    addonCat.clear();
    dishImage.clear();
    dishId.clear();

    /// Seperating wanted datas
    for (var element in response) {
      tableMenuList.addAll(element['table_menu_list']);
      notifyListeners();
    }

    for (var element in tableMenuList) {
      categoryDishes.addAll(element['category_dishes']);
      notifyListeners();
    }
    for (var element in categoryDishes) {
      dishId.add(element['dish_id']);
      dishName.add(element['dish_name']);
      dishPrice.add(element['dish_price']);
      dishCalories.add(element['dish_calories']);
      dishDescription.add(element['dish_description']);
      addonCat.add(element['addonCat']);
      dishImage.add(element['dish_image']);
      log('${element['dish_name']} ${element['dish_id']}');
      notifyListeners();
    }

    notifyListeners();
  }
}
