import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/homePage.dart';
import 'package:project/orderpage.dart';

class Orderplaced extends StatefulWidget {
  const Orderplaced({super.key});

  @override
  State<Orderplaced> createState() => _OrderplacedState();
}

class _OrderplacedState extends State<Orderplaced>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/shopping-bag.png",
                height: 150,
                width: 150,
              ),
            ),
          ),
          Center(
            child: Text(
              "Order Placed Successfully",
              style:
                  GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Kindly Check your order in My Orders",
                  style: GoogleFonts.inter(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OrderPage()));
              },
              child: Center(
                child: Container(
                    height: 44,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(252, 120, 70, 1),
                    ),
                    child: Center(
                      child: Text(
                        "View Order",
                        style: GoogleFonts.inter(
                            fontSize: 20, color: Colors.white),
                      ),
                    )),
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          title: '',
                        )),
              );
            },
            child: Text(
              "Continue",
              style: GoogleFonts.inter(
                fontSize: 22,
                color: const Color.fromRGBO(252, 120, 70, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
