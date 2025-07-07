import 'coffee.dart';

class CartItem {
  final Coffee coffee;
  int quantity;
  final String size;

  CartItem({
    required this.coffee,
    required this.quantity,
    required this.size,
  });

  // compare two items by coffee name & size
  bool isSameItem(CartItem other) {
    return coffee.name == other.coffee.name && size == other.size;
  }
}