import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/components/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const CartPage(),
          ));
        },
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            //Good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Good morning,',
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            //let's order fresh item for you

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'let\'s order fresh item for you',
                style: GoogleFonts.notoSerif(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            //divider
            const Padding(
              padding: EdgeInsets.all(3),
              child: Divider(),
            ),

            const SizedBox(
              height: 3,
            ),

            //fresh items + grid

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Fresh Items',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagepath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
