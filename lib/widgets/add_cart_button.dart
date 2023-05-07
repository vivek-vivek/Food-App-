import 'dart:developer';

import 'package:assignment_test_for_the_zartek/model/cart_model.dart';
import 'package:assignment_test_for_the_zartek/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class AddCartButton extends StatelessWidget {
  AddCartButton({super.key, required this.index});
  int count = 0;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(offset: Offset(2, 2), blurRadius: 1, color: Colors.black45),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              final home = Provider.of<HomeProvider>(context, listen: false);
              final cart = Provider.of<CartProvider>(context, listen: false);
              CartModel item = CartModel(
                id: home.dishId[index],
              
                name: home.dishName[index],
                price: home.dishPrice[index],
                calories: home.dishCalories[index],
              );
              cart.remove(item);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.maximize_outlined),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Text(
                (index >= 0 &&
                        index < Provider.of<CartProvider>(context).items.length)
                    ? '${Provider.of<CartProvider>(context).items[index].quantity}'
                    : '0',
                style: const TextStyle(fontSize: 10),
              )),
          InkWell(
            onTap: () {
              final home = Provider.of<HomeProvider>(context, listen: false);
              final cart = Provider.of<CartProvider>(context, listen: false);
              CartModel model = CartModel(
                id: home.dishId[index],
                
                name: home.dishName[index],
                price: home.dishPrice[index],
                calories: home.dishCalories[index],
              );
              cart.add(model);

              log(model.name);
            },
            child: const Padding(
              padding: EdgeInsets.only(bottom: 1.3, right: 5),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
