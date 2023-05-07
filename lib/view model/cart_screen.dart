import 'package:assignment_test_for_the_zartek/widgets/add_cart_button.dart';
import 'package:assignment_test_for_the_zartek/widgets/sizers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Order Summary',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 3,
        bottomOpacity: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Wrap(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                      "${Provider.of<CartProvider>(context).items.length} dishes - ${Provider.of<CartProvider>(context).items.length} items"),
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.only(top: 8),
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final cartItem =
                            Provider.of<CartProvider>(context).items[index];
                        return SizedBox(
                          height: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  ),
                                  kWidth10,
                                  SizedBox(
                                    width: 110,
                                    child: Text(
                                      cartItem.name,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  kWidth10,
                                  AddCartButton(index: index),
                                  kWidth10,
                                  kWidth5,
                                  Text(
                                    "INR ${cartItem.total}",
                                    style: const TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                              kHeight10,
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  "INR ${cartItem.price}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              kHeight10,
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  "${cartItem.calories} Calories",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.grey),
                      itemCount:
                          Provider.of<CartProvider>(context).items.length,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Toatal Amount",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "INR ${Provider.of<CartProvider>(context).payAmount}",
                        style: const TextStyle(color: Colors.green, fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Order placed successfully!"),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .clearCart();
                        Navigator.pop(context);
                        Navigator.pop(context); // go back to home screen
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: 360,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                "Place Order",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*



*/