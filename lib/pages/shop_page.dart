import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:coffee_shop/pages/details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    
    Future<void> onTap(Coffee coffee) async{
      final wasAdded = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsPage(coffee: coffee))
      );

      if(wasAdded == true){
        // let user know it has been successfully added
        showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
            backgroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, 
            ),
            title: Text(
              style: TextStyle(color: Colors.white),
              "Successfully added to cart",
            ),
          ),
        );
      }
    }

    return Consumer<CoffeeShop>(builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // heading message
             const Text(
              'How would you like your coffee?',
              style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 25),

              // list of coffee
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index){
                    // get indvidual coffee 
                    Coffee eachCoffee =value.coffeeShop[index];

                    // return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => onTap(eachCoffee),
                      icon: const Icon(Icons.arrow_forward),
                    );
                  }
                ),
              ),
          ],
        ),
      ),
    ));
  }
}