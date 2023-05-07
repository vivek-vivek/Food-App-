class CartModel {
  String id;

  String name;
  double price;
  double calories;
  int quantity;
  CartModel({
    required this.id,

    required this.name,
    required this.price,
    required this.calories,
    this.quantity = 1,
  });

  double get total => quantity * price;
}
