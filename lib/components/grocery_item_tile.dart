import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagepath;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  void Function()? onPressed;
  GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagepath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(11)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Image.asset(imagepath, height: 60),

            //itemName
            Text(itemName),

            //itemPrice + button

            MaterialButton(
              color: color[800],
              onPressed: onPressed,
              child: Text(
                '\$  $itemPrice',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
