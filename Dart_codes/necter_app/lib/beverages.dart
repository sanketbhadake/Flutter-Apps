import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<void> addToCart(
      Map<String, dynamic> item, BuildContext context) async {
    try {
      // Add the item to the 'cart' collection in Firestore
      await _firestore.collection('cart').add({
        'name': item['name'],
        'desc': item['desc'],
        'price': item['price'],
        'image': item['image'],
        'quantity': 1, // Default quantity
        'timestamp':
            FieldValue.serverTimestamp(), // Add a timestamp for sorting
      });
      log("Item added to cart: ${item['name']}");

      // Show a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              "Successfully Added To Cart..!",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
          behavior: SnackBarBehavior.floating, // Floating SnackBar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          duration: const Duration(seconds: 2), // Display duration
        ),
      );
    } catch (e) {
      log("Error adding item to cart: $e");
    }
  }


  List beverage = [
    {
      "image": "assets/jpg/coke.png",
      "name": "Diet Coke",
      "desc": "355ml, Price",
      "price": 50,
    },
    {
      "image": "assets/jpg/pepsi.png",
      "name": "Pepsi Can",
      "desc": "330ml, Price",
      "price": 60,
    },
    {
      "image": "assets/jpg/sprite.png",
      "name": "Sprite Can",
      "desc": "325ml, Price",
      "price": 65,
    },
    {
      "image": "assets/jpg/applejuice.png",
      "name": "Apple Juice",
      "desc": "2L Price",
      "price": 90,
    },
    {
      "image": "assets/jpg/orange juice.png",
      "name": "Orenge Juice",
      "desc": "2L, Price",
      "price": 95,
    },
    {
      "image": "assets/jpg/co co la.png",
      "name": "Coca Cola Can",
      "desc": "325ml, Price",
      "price": 75,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Beverages",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.tune_rounded),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: beverage.length,
                itemBuilder: (context, index) => Container(
                  height: 255,
                  width: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(36, 0, 0, 0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                "${beverage[index]["image"]}",
                                scale: 1,
                              )),
                        )),
                        Text(
                          "${beverage[index]["name"]}",
                          style: GoogleFonts.dmSans(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${beverage[index]["desc"]}",
                          style: GoogleFonts.dmSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "₹${beverage[index]["price"]}.00",
                              style: GoogleFonts.dmSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                               onTap: () {
                                        Map<String, dynamic> itemData =
                                            beverage[index]
                                                as Map<String, dynamic>;
                                        // Add the item to the cart
                                        addToCart(itemData, context);
                                      },
                              
                              child: Container(
                                height: 46,
                                width: 46,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(83, 177, 117, 1),
                                    borderRadius: BorderRadius.circular(18)),
                                child: const Icon(Icons.add, color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
