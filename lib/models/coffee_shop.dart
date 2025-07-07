import 'package:flutter/material.dart';
import 'coffee.dart';
import 'cart_item.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(
      name: 'Long Black', 
      price: 4.10, 
      imagePath: 'lib/images/black.png',
    ),

    // latte
    Coffee(
      name: 'Latte', 
      price: 4.20, 
      imagePath: 'lib/images/latte.png',
    ),

     // Espresso
    Coffee(
      name: 'Espresso', 
      price: 3.50, 
      imagePath: 'lib/images/espresso.png',
    ),

    // iced coffee
    Coffee(
      name: 'Iced Coffee', 
      price: 4.40, 
      imagePath: 'lib/images/iced_coffee.png',
    ),
  ];

  // user cart
  final List<CartItem> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<CartItem> get userCart => _userCart;

  // cart total price
  double get totalPrice {
    double total = 0;
    for (var item in _userCart){
      total += item.coffee.price * item.quantity;
    }
    return total;
  }

  // add item to cart
  void addItemToCart(Coffee coffee, int quantity, String size){
    CartItem newItem = CartItem(coffee: coffee, quantity: quantity, size: size);
    
    // check if similar item already exists
    for (var item in _userCart){
      if(item.isSameItem(newItem)){
        item.quantity += quantity;
        notifyListeners();
        return;
      }
    }
    // new item
    _userCart.add(newItem);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(CartItem item){
    _userCart.remove(item);
    notifyListeners();
  }
}