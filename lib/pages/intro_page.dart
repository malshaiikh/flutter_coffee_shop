import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../const.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset(
                  'lib/images/logo.png',
                  height: 200,
                ),
            
                const SizedBox(height: 60),
            
                // title
                Text(
                  'Brew Day',
                  style: TextStyle(
                    color: Colors.brown[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // subtitle
                Text(
                  'How do you like your coffee?',
                  style: TextStyle(
                    color: Colors.brown[600],
                    fontSize: 15,
                  ),
                ),
                
                const SizedBox(height: 50),
            
                // button
                MyButton(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  text: 'Enter Shop',
                  color: Colors.brown[800],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
