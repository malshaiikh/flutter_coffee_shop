import 'package:coffee_shop/components/quantity_picker.dart';
import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/size_picker.dart';
import '../models/coffee.dart';

class DetailsPage extends StatefulWidget {
  final Coffee coffee;
  const DetailsPage({super.key, required this.coffee});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  String selectedSize = "S";

  // add coffee to cart
  void addToCart(Coffee coffee){
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee, quantity, selectedSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // app bar
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // coffee picture
                Image.asset(
                  widget.coffee.imagePath,
                  height: 120,
                ),          
                const SizedBox(height: 50),
            
                // quantity 
                const Text(
                  'Q U A N T I T Y',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),

                // quantity picker
                QuantityPicker(
                  quantity: quantity, 
                  onDecrement: (){
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  }, 
                  onIncrement: (){
                    setState(() {
                      quantity++;
                    });
                  }
                ),
                const SizedBox(height: 40),

                // size
                const Text(
                  'S I Z E',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),

                // size picker
                SizePicker(
                  sizes: const ['S', 'M', 'L'],
                  selectedSize: selectedSize,
                  onSizeSelected: (newSize) {
                    setState(() {
                      selectedSize = newSize;
                    });
                  }
                ),
                const SizedBox(height: 70),
            
                // add button
                MyButton(
                  onTap: () {
                    addToCart(widget.coffee);
                    Navigator.pop(context, true);
                  },
                  text: 'Add to cart',
                  color: Colors.brown[500],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}