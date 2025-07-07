import 'package:flutter/material.dart';

class SizePicker extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final Function(String) onSizeSelected;

  const SizePicker({
    super.key, 
    required this.sizes, 
    required this.selectedSize, 
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sizes.map((size) {
        final isSelected = selectedSize == size;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: GestureDetector(
            onTap: (){
             onSizeSelected(size);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected ? Colors.brown[400] : Colors.grey[200],
                borderRadius: BorderRadius.circular(40)
              ),
              child: Center(
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.brown[300],
                    fontSize: 15,
                  ),
                )
              ),
            ),     
          ),
        );
      }).toList(),
    );
  }
}