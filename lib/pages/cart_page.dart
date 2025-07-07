import 'package:coffee_shop/components/cart_item_tile.dart';
import 'package:coffee_shop/models/cart_item.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // remove item from cart 
  void removeFromCart(CartItem item){
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(item);
  }

  // pay button tapped
  void payNow() {
    /*

      payment service 
    
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // heading
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 25),

            // list of cart items
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
                // get indivdual cart items
                CartItem item = value.userCart[index];

                // return coffee tile
                return ItemTile(
                  item: item, 
                  onPressed: () => removeFromCart(item), 
                );
              }
            ),),

            // total price
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Total price: \$${value.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 15),
              ),
            ),

            // pay button
            MyButton(
              onTap: payNow,
              text: 'Pay Now',
              color: Colors.brown[500],
            ),
          ],
        ),
      )
    ),);
  }
}
