import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Item> _items = [
    Item(name: 'Item 1', quantity: 1),
    Item(name: 'Item 2', quantity: 2),
    Item(name: 'Item 3', quantity: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_items[index].name),
            subtitle: Row(
              children: [
                Text('Quantity: ${_items[index].quantity}'),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _items[index].quantity++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_items[index].quantity > 0) {
                        _items[index].quantity--;
                      }
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  int quantity;

  Item({required this.name, required this.quantity});
}
