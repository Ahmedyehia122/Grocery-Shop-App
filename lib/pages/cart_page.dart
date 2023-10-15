import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'My Cart',
                    style: GoogleFonts.notoSerif(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            leading: Image.asset(value.cartItems[index][2],
                                height: 40),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('\$' + value.cartItems[index][1]),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index);
                              },
                              icon: const Icon(Icons.cancel),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //total + pay now

                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total price',
                                style: TextStyle(color: Colors.green[100]),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '\$' + value.calculateTotal(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          //pay now button

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: Colors.green.shade100)),
                            child: const Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Text(
                                    'Pay Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
