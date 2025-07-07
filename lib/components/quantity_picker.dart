import 'package:flutter/material.dart';

class QuantityPicker extends StatelessWidget {
  final int quantity;
  final void Function()? onDecrement;
  final void Function()? onIncrement;  

  const QuantityPicker({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // decrement
        GestureDetector(
          onTap: onDecrement,
          child: Icon(Icons.remove, color: Colors.brown[300],),

        ),

        // quantity
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Text(
                quantity.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.brown[800],
                ),
              ),
            ),
          ),
        ),
        
        // increment
        GestureDetector(
          onTap: onIncrement,
          child: Icon(Icons.add, color: Colors.brown[300],),
        ),
      ],
    );
  }
}