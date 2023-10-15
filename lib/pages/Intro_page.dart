import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding:
                const EdgeInsets.only(top: 90, left: 90, right: 90, bottom: 30),
            child: Image.asset('lib/images/avocado.png'),
          ),

          // we deliver groceries at your doorstep
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          //Fresh items everyday
          const Text(
            'Fresh items everyday',
            style: TextStyle(color: Color.fromARGB(255, 129, 128, 128)),
          ),

          const Spacer(),

          //get started button
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
