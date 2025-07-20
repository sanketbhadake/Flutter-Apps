import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:necter_app/placeorder.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  List cartdata = [];
  bool isLoading = true; // Track loading state
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    QuerySnapshot snapshot1 = await _firestore.collection('cart').get();

    setState(() {
      cartdata = snapshot1.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        // Add the document ID to the data
        data['id'] = doc.id;
        // Initialize quantity if it doesn't exist
        if (data['quantity'] == null) {
          data['quantity'] = 1;
        }
        return data;
      }).toList();
      isLoading = false; // Set loading to false after data is fetched
    });
    log("data:  ${cartdata.toString()}");
  }

  void increaseQuantity(int index) {
    setState(() {
      cartdata[index]['quantity']++;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartdata[index]['quantity'] > 1) {
        cartdata[index]['quantity']--;
      } else {
        // Remove the item if quantity is 1
        cartdata.removeAt(index);
      }
    });
  }

  dynamic calculateTotalPrice() {
    dynamic totalPrice = 0;
    for (var item in cartdata) {
      dynamic price = item['price'] * item['quantity'];
      totalPrice += price;
    }
    return totalPrice;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Checkout",
                          style: GoogleFonts.dmSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset("assets/svg/cancel.svg"))
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery",
                          style: GoogleFonts.dmSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        ),
                        const Spacer(),
                        Text(
                          "Select Method",
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        )
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Payment",
                          style: GoogleFonts.dmSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        ),
                        const Spacer(),
                        Image.asset("assets/jpg/card.png"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        )
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Promo Code",
                          style: GoogleFonts.dmSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        ),
                        const Spacer(),
                        Text(
                          "Pick discount",
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total cost",
                          style: GoogleFonts.dmSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(124, 124, 124, 1)),
                        ),
                        const Spacer(),
                        Text(
                          "₹${calculateTotalPrice().toStringAsFixed(2)}",
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      height: 40,
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "By placing an order you agree to our\n",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          color: const Color.fromRGBO(171, 170, 170, 1),
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color:
                                  Colors.black, // Different color for "Terms"
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " And ",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: const Color.fromRGBO(171, 170, 170, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "Conditions",
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: Colors
                                  .black, // Different color for "Conditions"
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PlaceorderScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(83, 177, 117, 1),
                        ),
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: GoogleFonts.dmSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  // Shimmer effect widget
  Widget buildShimmerEffect() {
    return ListView.builder(
      itemCount: 4, // Number of shimmer placeholders
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 20,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Color.fromARGB(113, 158, 158, 158),
            thickness: 1.0,
            height: 1.0,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cart",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading
                  ? buildShimmerEffect() // Show shimmer effect while loading
                  : ListView.builder(
                      itemCount: cartdata.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Image.asset(cartdata[index]["image"]),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cartdata[index]["name"],
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                // Remove the item from the cart
                                                await _firestore
                                                    .collection('cart')
                                                    .doc(cartdata[index]['id'])
                                                    .delete();
                                                // Refresh the cart data
                                                getData();
                                              },
                                              child: const Icon(Icons.cancel),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          cartdata[index]["desc"],
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                124, 124, 124, 1),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // Decrease quantity
                                                decreaseQuantity(index);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              240,
                                                              240,
                                                              240,
                                                              1)),
                                                ),
                                                child: const Icon(Icons.remove),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Center(
                                              child: Text(
                                                "${cartdata[index]["quantity"]}",
                                                style: GoogleFonts.dmSans(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            GestureDetector(
                                              onTap: () {
                                                // Increase quantity
                                                increaseQuantity(index);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromRGBO(
                                                              240,
                                                              240,
                                                              240,
                                                              1)),
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Color.fromRGBO(
                                                      83, 177, 117, 1),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "₹${(cartdata[index]["price"] * cartdata[index]["quantity"]).toStringAsFixed(2)}",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(113, 158, 158, 158),
                            thickness: 1.0,
                            height: 1.0,
                            indent: 10,
                            endIndent: 10,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
            ),
            isLoading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      showbottomsheet();
                    },
                    child: Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(83, 177, 117, 1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              "Go to Checkout",
                              style: GoogleFonts.dmSans(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 27,
                              width: 57,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color.fromRGBO(57, 124, 82, 1),
                              ),
                              child: Center(
                                child: Text(
                                  "₹${calculateTotalPrice().toStringAsFixed(2)}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
