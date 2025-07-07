import 'package:coffee_shop/models/cart_item.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final CartItem item;
  final void Function()? onPressed;

  const ItemTile({
    super.key, 
    required this.item, 
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(item.coffee.name),
        subtitle: Text(
         '${item.size}      x${item.quantity}      \$${(item.quantity * item.coffee.price).toStringAsFixed(2)}',
        ),
        leading: Image.asset(item.coffee.imagePath),
        trailing: IconButton(
          onPressed: onPressed, 
          icon: const Icon(Icons.delete),
          color: Colors.brown[300],
          ),
      ),
    );
  }
}