import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/Intro_page.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const GroceryShopApp());
}

class GroceryShopApp extends StatelessWidget {
  const GroceryShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: IntroPage(),
      ),
    );
  }
}
